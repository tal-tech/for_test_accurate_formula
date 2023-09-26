#include "rec_formula_recognization.hpp"
#include "merge_model.h"
#include <iostream>
#include <fstream>
#include <chrono>
#include <string>
#include <iomanip>
#include <thread>
#include <vector>
#include <string>
#include<math.h>
#include<iostream>
#include <json.h>
#pragma once

using namespace std;
//仅测试用
/*
#include <boost/log/core.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/sinks/text_file_backend.hpp>
#include <boost/log/sources/record_ostream.hpp>
#include <boost/log/sources/severity_channel_logger.hpp>
#include <boost/log/sources/severity_logger.hpp>
#include <boost/log/trivial.hpp>
#include <boost/log/utility/setup/common_attributes.hpp>
#include <boost/log/utility/setup/file.hpp>
#include <boost/property_tree/ptree.hpp>
*/

using namespace facethink;

int modelNum = 3;
ofstream ffile("fixRatio.txt");

int threadFunc(const int threadId, const std::vector<cv::Mat> imgV,const RecFormulaRecognization *regModel,  vector<vector<regData>> &mulRegData)
{
     vector<string> formulaResult;
     vector<float> formulaProb;

     vector<vector<regData>> mulData;
     regData oneRegData;
     vector<regData> regBatch;
     
     int ret = regModel->detect(imgV, formulaResult, formulaProb);
     
     for (int ii=0;ii<formulaResult.size(); ii++)
     {
	     oneRegData.reg = formulaResult[ii];
	     oneRegData.prob = formulaProb[ii];
	     regBatch.push_back(oneRegData);
     }
     mulRegData[threadId] = regBatch;
}


void getImgName(string imglist,vector<string> &vecImgList)
{
	ifstream in(imglist,ios::in);
	string imgName;

	while(!in.eof())
	{
		while (getline(in,imgName))
		{
			vecImgList.push_back(imgName);
		}
	}
	in.close();
}


int convetImg2Color(const cv::Mat& imgIn, cv::Mat& imgColor)
{
	imgColor = imgIn.clone();
	if (imgIn.channels() == 1)
	{
		cv::cvtColor(imgIn, imgColor, cv::COLOR_GRAY2BGR);
	}
	else if (imgIn.channels() == 4)
	{
		
		std::vector<cv::Mat> vecAllChs;
		cv::split(imgIn, vecAllChs);
		cv::Mat imgMask = vecAllChs[3] == 0;
		cv::Mat imgBG(imgIn.size(), imgIn.type(), cv::Scalar(255, 255, 255, 255));
		imgBG.copyTo(imgColor, imgMask);
		cv::cvtColor(imgColor, imgColor, cv::COLOR_BGRA2BGR);
	}
	if (imgColor.channels() != 3)
	{
		imgColor = cv::Mat();
		return -1;
	}
	return 0;
}


int main(int argc, char *argv[])
{
    if (argc < 6)
    {
        std::cerr << "Usage: "
                  << argv[0]
                  << " encoder_model_path"
                  << " decoder_model_path"
                  << " config_file_path"
                  << " word_dict_path"
                  << " image_path"
                  << std::endl;
        return 1;
    }

    // 加载命令行参数
    const std::string encoder_model_path_1 = argv[1];
    const std::string encoder_model_path_2 = argv[2];
    const std::string encoder_model_path_3 = argv[3];

    const std::string decoder_model_path_1 = argv[4];
    const std::string decoder_model_path_2 = argv[5];
    const std::string decoder_model_path_3 = argv[6];

    const std::string config_path_1 = argv[7];
    const std::string config_path_2 = argv[8];
    const std::string config_path_3 = argv[9];
    const std::string word_dict_path = argv[10];
    const std::string img_path = argv[11];
    const int batch_test =atoi( argv[12]) ;


    // 创建SDK实例
    vector<RecFormulaRecognization *> detectorV;
    RecFormulaRecognization *detector = RecFormulaRecognization::create(encoder_model_path_1, decoder_model_path_1, config_path_1, word_dict_path);
    RecFormulaRecognization *detector_2 = RecFormulaRecognization::create(encoder_model_path_2, decoder_model_path_2, config_path_2, word_dict_path);
    RecFormulaRecognization *detector_k12 = RecFormulaRecognization::create(encoder_model_path_3, decoder_model_path_3, config_path_3, word_dict_path);
    detectorV.push_back(detector);
    detectorV.push_back(detector_2);
    detectorV.push_back(detector_k12);
    vector<string> vecImgList;

    getImgName(img_path,vecImgList);


    // 调用SDK处理图片，并获取输出F
    if  (1>0)
    {	    
		double cost_time_all = 0;
		int count = 0;
		string imgFullPath;
		int imgAllNum = vecImgList.size();
		int group_size = ceil(imgAllNum/batch_test);
		vector<float> timeV;
		for(int i = 0; i < group_size; i++)
		{
			Json::Value jsonRoot;
			Json::Value jsonData;
			Json::Value jsonDataOne;
			jsonRoot["code"] = 20001; 
			cout<<"index:"<<i<<std::endl;

			int start_index = i*batch_test;
			int end_index = min(start_index+batch_test , imgAllNum);
			std::vector<string> batchImgList(vecImgList.begin()+start_index , vecImgList.begin()+end_index);

			auto start_time = std::chrono::steady_clock::now();
			std::vector<std::string> regRes;
			std::vector<std::string> formulas;
			std::vector<float>  regProb;
			std::vector<cv::Mat> inputImgV;
	

			for (int jj= 0;jj<batchImgList.size();jj++)
			{
				string imgFullPath = batchImgList[jj];
				cv::Mat image = cv::imread(imgFullPath,cv::IMREAD_UNCHANGED);
				//cv::Mat image = cv::imread(imgFullPath);
				cv::Mat imageOut;
				int convertFlag = convetImg2Color(image, imageOut);
				if (convertFlag!=0)
				{
					jsonRoot["code"] = 3001;
					jsonRoot["data"] = "";
					jsonRoot["msg"] = "data paras error!";	
					return;
				}

				regRes.push_back("");
				regProb.push_back(-999);
				cv::imwrite("1.jpg",imageOut);
				inputImgV.push_back(imageOut);
			}

			std::string one;
			int threadNum= 3;
			//std::thread threads[threadNum];
			vector<vector<regData>> mulRegData(3);
			#pragma omp parallel for
			for (int thread_n = 0;thread_n<threadNum; thread_n++)
			{
				//threads[thread_n]=std::thread(threadFunc,thread_n ,std::cref(inputImgV),detectorV[thread_n], std::ref(mulRegData));
				threadFunc(thread_n ,std::cref(inputImgV),detectorV[thread_n], std::ref(mulRegData));
	        }
                      
                        /* 
			for (auto &thread :threads)
				thread.join();
			*/
			
			for (int iii = 0 ;iii< modelNum; iii++)
			{
				for(int jjj = 0 ;jjj<mulRegData[iii].size(); jjj++)
				{
					cout<<mulRegData[iii][jjj].reg<<" pp:"<<mulRegData[iii][jjj].prob <<std::endl;
				}
			}
                        
			merge_model *merge_modelP = new merge_model();
			vector<regData> lastPre;
			// 模型结果融合
			vector<int> mulFlagVec;
	
			int mergeFlag = merge_modelP->merge_resultBatch(mulRegData[0],mulRegData[1],mulRegData[2], mulFlagVec,lastPre);
			
			if( mergeFlag!=0)
			{
				jsonRoot["code"] = 3002;
				jsonRoot["data"] = "";
				jsonRoot["msg"] = "Merge model result error!";
				return;
			}
                        
			for (int jj=0;jj< mulRegData[0].size();jj++ )
			{
       			        ffile<< batchImgList[jj] <<' '<< lastPre[jj].reg<<endl;
				//std::cout<< batchImgList[jj] <<' '<< lastPre[jj].reg<<  " "<< lastPre[jj].prob<< endl;
				//ffile<< batchImgList[jj] <<' '<< mulRegData[2][jj].reg<<" mulFlag:"<<mulFlagVec[jj]<<endl;

			}
			
			for (int jj = 0; jj < lastPre.size(); jj++)
			{
				jsonDataOne["result"] = Json::Value(lastPre[jj].reg);
				jsonDataOne["prob"] = Json::Value(lastPre[jj].prob);
				jsonData.append(jsonDataOne);
			}


			double cost_time = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now() - start_time).count();
			std::cout<<"cost_time:"<<cost_time<< std::endl;
			++count;
			
		       	
			if(count > 1)
			{
				timeV.push_back(cost_time);
				cost_time_all += cost_time;
			}
			
			if (merge_modelP!=NULL)
			{
				delete merge_modelP;
				merge_modelP = NULL;
			}
			jsonRoot["data"] = jsonData; 
			jsonRoot["msg"] = "OK!";	
			string jsonOut = jsonRoot.toStyledString();
			std::cout << "json result:" << jsonOut << std::endl;
		}

		if(count > 1)
		{
			int p90_index = int(timeV.size()*0.9);
			sort(timeV.begin(), timeV.end());
			float p90_time = timeV[p90_index];

			std::cout << "cost all time: "<< cost_time_all << " ms" << std::endl;
			std::cout << "min time: " << timeV[0] << " ms" << std::endl;
			std::cout << "max time: " << timeV[timeV.size()-1] << " ms" << std::endl;
			std::cout << "avg_cost_time: "<< cost_time_all/(count - 1) << " ms" << std::endl;
			std::cout << "p90 time: " << p90_time << " ms" << std::endl;
		}
	}  
    return 0;
}
