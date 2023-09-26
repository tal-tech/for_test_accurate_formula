#include "accurate_formula.h"
#include "base/base64.h"
#include "base/logging.h"
#include "base/time/time.h"
#include "base/base_paths.h"
#include "base/path_service.h"
#include "base/files/file_path.h"
#include "base/files/file_util.h"

#include "thread_pool.h"

static Pool::ThreadPool thread_pool{16};
/**
 * 此处对HandleRequest包装一层的目的：防止当前HandleRequest不能很好的
 * 满足后续的需求；若能满足，也可以直接在service_main.cpp的Listen中直
 * 接调用HandleRequest方法
 */
merge_model AccurateFormula::m_merge_model_;
std::string AccurateFormula::encoder_model_path1_;
std::string AccurateFormula::encoder_model_path2_;
std::string AccurateFormula::encoder_model_path3_;
std::string AccurateFormula::decoder_model_path1_;
std::string AccurateFormula::decoder_model_path2_;
std::string AccurateFormula::decoder_model_path3_;
std::string AccurateFormula::config_path1_;
std::string AccurateFormula::config_path2_;
std::string AccurateFormula::config_path3_;
std::string AccurateFormula::word_dict_path1_;
std::string AccurateFormula::word_dict_path2_;
std::string AccurateFormula::word_dict_path3_;
std::unique_ptr<RecFormulaRecognization> AccurateFormula::p_detector1_ = nullptr;
std::unique_ptr<RecFormulaRecognization> AccurateFormula::p_detector2_ = nullptr;
std::unique_ptr<RecFormulaRecognization> AccurateFormula::p_detector3_ = nullptr;

AccurateFormula::AccurateFormula(const std::string &interface_url, const crow::request &request) :
        ImageInterface(interface_url, request) {
}

bool AccurateFormula::Init() {
    base::FilePath fp;
    std::string program_dir;
    if(!base::PathService::Get(base::BasePathKey::DIR_EXE, &fp)) {
        LOG(ERROR) << "get exe path failed";
        return false;
    }

    encoder_model_path1_ = fp.AsUTF8Unsafe() + "/../../formula/model/optimized_batch6_rec_formula_recognization_encoder_v1.0.1.pt";
    encoder_model_path2_ = fp.AsUTF8Unsafe() + "/../../formula/model/optimized_batch6_rec_formula_recognization_encoder_v1.0.2.pt";
    encoder_model_path3_ = fp.AsUTF8Unsafe() + "/../../formula/model/optimized_batch6_rec_formula_recognization_encoder_v1.0.0.pt";
    decoder_model_path1_ = fp.AsUTF8Unsafe() + "/../../formula/model/optimized_batch6_rec_formula_recognization_decoder_v1.0.1.pt";
    decoder_model_path2_ = fp.AsUTF8Unsafe() + "/../../formula/model/optimized_batch6_rec_formula_recognization_decoder_v1.0.2.pt";
    decoder_model_path3_ = fp.AsUTF8Unsafe() + "/../../formula/model/optimized_batch6_rec_formula_recognization_decoder_v1.0.0.pt";
    config_path1_        = fp.AsUTF8Unsafe() + "/../../formula/model/config_v1.0.1.ini";
    config_path2_        = fp.AsUTF8Unsafe() + "/../../formula/model/config_v1.0.2.ini";
    config_path3_        = fp.AsUTF8Unsafe() + "/../../formula/model/config_v1.0.0.ini";
    word_dict_path1_     = fp.AsUTF8Unsafe() + "/../../formula/model/rec_formula_recognization_words_v1.0.1.txt";
    word_dict_path2_     = fp.AsUTF8Unsafe() + "/../../formula/model/rec_formula_recognization_words_v1.0.2.txt";
    word_dict_path3_     = fp.AsUTF8Unsafe() + "/../../formula/model/rec_formula_recognization_words_v1.0.0.txt";

    // init algorithm model
    if (nullptr == p_detector1_) {
        p_detector1_.reset(RecFormulaRecognization::create(encoder_model_path1_,
                                                        decoder_model_path1_,
                                                        config_path1_,
                                                        word_dict_path1_));
    }
    if (nullptr == p_detector2_) {
        p_detector2_.reset(RecFormulaRecognization::create(encoder_model_path2_,
                                                        decoder_model_path2_,
                                                        config_path2_,
                                                        word_dict_path2_));
    }
    if (nullptr == p_detector3_) {
        p_detector3_.reset(RecFormulaRecognization::create(encoder_model_path3_,
                                                        decoder_model_path3_,
                                                        config_path3_,
                                                        word_dict_path3_));
    }
    return true;
}

void AccurateFormula::ProcessRequest(std::string &response) {
    HandleRequest(response);
}

TALError AccurateFormula::handler(Json::Value &result) {
    TALError res;
    int64_t process_start_time = base::Time::Now().ToJavaTime();
    // 校验除请求body格式及image_url、image_base64之外的参数
    if ((res=VerifyRegFlag()) != SERVICE_ERROR.E_OK) {
        return res;
    }

    // TODO: 业务处理及调用模型等，下面是模拟输出结果
    std::vector<regData> result1;
    std::vector<regData> result2;
    std::vector<regData> result3;
    std::vector<int> mulFlagVec;
    std::vector<regData> lastPre;
    if (0 == reg_flag_) {
        LOG(INFO) << "requestid:" << request_id_ << ", reg flag:0";
        std::future<std::vector<regData>> func1 = thread_pool.commit(AccurateFormula::ModelFunc
                                                                    , cv_image_
                                                                    , p_detector1_.get());
        std::future<std::vector<regData>> func2 = thread_pool.commit(AccurateFormula::ModelFunc
                                                                    , cv_image_
                                                                    , p_detector2_.get());
        std::future<std::vector<regData>> func3 = thread_pool.commit(AccurateFormula::ModelFunc
                                                                    , cv_image_
                                                                    , p_detector3_.get());
        result1 = func1.get();
        result2 = func2.get();
        result3 = func3.get();
    } else if (1 == reg_flag_) {
        LOG(INFO) << "requestid:" << request_id_ << ", reg flag:1";
        std::future<std::vector<regData>> func1 = thread_pool.commit(AccurateFormula::ModelFunc
                                                                    , cv_image_
                                                                    , p_detector1_.get());
        std::future<std::vector<regData>> func2 = thread_pool.commit(AccurateFormula::ModelFunc
                                                                    , cv_image_
                                                                    , p_detector2_.get());
        result1 = func1.get();
        result2 = func2.get();
    } else if (2 == reg_flag_) {
        LOG(INFO) << "requestid:" << request_id_ << ", reg flag:2";
        std::future<std::vector<regData>> func1 = thread_pool.commit(AccurateFormula::ModelFunc
                                                                    , cv_image_
                                                                    , p_detector1_.get());
        result1 = func1.get();
    }

    if (result1.empty() && result2.empty() && result3.empty())
        return SERVICE_ERROR.E_ALGORITHM;

    int ret = m_merge_model_.merge_resultBatch(result1, result2, result3, mulFlagVec, lastPre);
    if (0 != ret)
        return SERVICE_ERROR.E_ALGORITHM;

    for (auto & reg : lastPre) {
        Json::Value json_data;
        json_data["reg_prob"]       = reg.prob;
        json_data["formula_result"] = reg.reg;
        result["data"].append(json_data);
    }

    return res;
}

TALError AccurateFormula::VerifyRegFlag() {
    if (!request_body_json_.isMember("reg_flag")) {
        return SERVICE_ERROR.E_OK;
    }
    if (!request_body_json_["reg_flag"].isInt()) {
        return SERVICE_ERROR.E_REGFLAG_INCOMPLETE;
    }
    reg_flag_ = request_body_json_["reg_flag"].asInt();
    if (0 != reg_flag_ && 1 != reg_flag_ && 2 != reg_flag_)
        return SERVICE_ERROR.E_REGFLAG_INCOMPLETE;
    return SERVICE_ERROR.E_OK;
}

std::vector<regData> AccurateFormula::ModelFunc(std::vector<cv::Mat> cv_image, RecFormulaRecognization* detector)
{
    std::vector<regData> reg_data;
    std::vector<float> formula_pro;
    std::vector<std::string> formula_result;
    int ret = detector->detect(cv_image, formula_result, formula_pro);
    if (0 != ret)
        return reg_data;

    for (int i = 0; i < formula_pro.size(); ++i) {
        regData data;
        data.prob = formula_pro[i];
        data.reg  = formula_result[i];
        reg_data.emplace_back(data);
    }
    return reg_data;
}
