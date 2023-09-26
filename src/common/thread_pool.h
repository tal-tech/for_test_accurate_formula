#ifndef _THREAD_POOL_H_
#define _THREAD_POOL_H_

#include <vector>
#include <queue>
#include <atomic>
#include <future>
#include <condition_variable>
#include <thread>
#include <functional>
#include <stdexcept>
using namespace std;

namespace Pool
{
    #define  THREADPOOL_MAX_NUM 16  //线程池最大容量,应尽量设小一点

    class ThreadPool
    {
        using Task = function<void()>;	  //定义类型

        vector<thread>     pool_;         //线程池
        queue<Task>        tasks_;        //任务队列
        mutex              lock_;         //同步
        condition_variable task_cv_;      //条件阻塞
        atomic<bool>       run_{true};    //线程池是否执行
        atomic<int>        idle_thread_num_{0}; //空闲线程数量

    public:
        inline ThreadPool(unsigned short size = 4) { addThread(size); }
        inline ~ThreadPool()
        {
            run_ = false;
            task_cv_.notify_all(); // 唤醒所有线程执行
            for (thread& thread : pool_) {
                //thread.detach(); // 让线程“自生自灭”
                if(thread.joinable())
                    thread.join(); // 等待任务结束， 前提：线程一定会执行完
            }
        }

    public:
        // 提交一个任务
        // 调用.get()获取返回值会等待任务执行完,获取返回值
        // 有两种方法可以实现调用类成员，
        // 一种是使用   bind： .commit(std::bind(&Dog::sayHello, &dog));
        // 一种是用   mem_fn： .commit(std::mem_fn(&Dog::sayHello), this)
        template<class F, class... Args>
        auto commit(F&& f, Args&&... args) ->future<decltype(f(args...))>
        {
            if (!run_)
                throw runtime_error("commit on ThreadPool is stopped.");

            // typename std::result_of<F(Args...)>::type, 函数 f 的返回值类型
            using RetType = decltype(f(args...));
            // 把函数入口及参数,打包(绑定)
            auto task = make_shared<packaged_task<RetType()>>(bind(forward<F>(f), forward<Args>(args)...));
            future<RetType> future = task->get_future();
            {
                // 添加任务到队列
                lock_guard<mutex> lock{lock_};
                // push(Task{...}) 放到队列后面
                tasks_.emplace([task](){
                    (*task)();
                });
            }
#ifdef THREADPOOL_AUTO_GROW
            if (idle_thread_num_ < 1 && pool_.size() < THREADPOOL_MAX_NUM)
			addThread(1);
#endif // !THREADPOOL_AUTO_GROW
            task_cv_.notify_one(); // 唤醒一个线程执行
            return future;
        }

        //空闲线程数量
        int idlCount() {return idle_thread_num_;}
        //线程数量
        int thrCount() {return pool_.size();}
#ifndef THREADPOOL_AUTO_GROW
    private:
#endif // !THREADPOOL_AUTO_GROW

        //添加指定数量的线程
        void addThread(unsigned short size)
        {
            for (; pool_.size() < THREADPOOL_MAX_NUM && size > 0; --size)
            {
                //增加线程数量,但不超过 预定义数量 THREADPOOL_MAX_NUM
                pool_.emplace_back([this]{ //工作线程函数
                    while (run_)
                    {
                        Task task; // 获取一个待执行的 task
                        {
                            // unique_lock 相比 lock_guard 的好处是：可以随时 unlock() 和 lock()
                            unique_lock<mutex> lock{lock_};
                            // wait 直到有 task
                            task_cv_.wait(lock, [this]{
                                return !run_ || !tasks_.empty();
                            });
                            if (!run_ && tasks_.empty())
                                return;
                            // 按先进先出从队列取一个 task
                            task = move(tasks_.front());
                            tasks_.pop();
                        }
                        idle_thread_num_--;
                        task();//执行任务
                        idle_thread_num_++;
                    }
                });
                idle_thread_num_++;
            }
        }
    };
}

#endif /*_THREAD_POOL_H_*/
