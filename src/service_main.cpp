#include "init_server.h"
#include "base/strings/string_number_conversions.h"
#include "base/command_line.h"

#include "accurate_formula.h"

static void Listen() {
    RequestEvents url_events;
    auto demo_request = [](const crow::request &request, std::string &response)->void {
        // 这个路由是PaaS新增业务时的路由地址全称：对外的地址全称
        AccurateFormula service{"/aiocr/accurate-formula", request};
        service.ProcessRequest(response);
    };
    // 这个路由是PaaS新增业务时替换前缀后面的那部分，这里的样例是在PaaS中
    // 配置的替换前缀为2
    auto demo_url = std::make_pair("/", HTTP_METHOD::POST);
    // GET just for detect services status
    auto get_demo_request = [] (const crow::request &request, std::string &response) ->void {
    };
    auto get_demo_url = std::make_pair("/test", HTTP_METHOD::GET);
    url_events.emplace_back(std::make_pair(demo_url, demo_request));
    url_events.emplace_back(std::make_pair(get_demo_url, get_demo_request));

    Listen(url_events);
}

int main(int argc, char** argv) {
    base::CommandLine::Init(argc, argv);

    // TODO:增加和业务相关的初始化等逻辑
    AccurateFormula::Init();

    InitService();

    Listen();

    ReleaseService();

    return 0;
}
