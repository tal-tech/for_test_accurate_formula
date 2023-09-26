#pragma once

#include "image_interface.h"
#include "merge_model.h" // algorithm header
#include "rec_formula_recognization.hpp" // algorithm header

#include <string>
#include <vector>

using namespace facethink; // algorithm namespace


class AccurateFormula final : public ImageInterface {
private:
    int                               reg_flag_{0};  // 0; 1; 2
    static merge_model                m_merge_model_;
    static std::string                encoder_model_path1_;
    static std::string                encoder_model_path2_;
    static std::string                encoder_model_path3_;
    static std::string                decoder_model_path1_;
    static std::string                decoder_model_path2_;
    static std::string                decoder_model_path3_;
    static std::string                config_path1_;
    static std::string                config_path2_;
    static std::string                config_path3_;
    static std::string                word_dict_path1_;
    static std::string                word_dict_path2_;
    static std::string                word_dict_path3_;
    static std::unique_ptr<RecFormulaRecognization> p_detector1_;
    static std::unique_ptr<RecFormulaRecognization> p_detector2_;
    static std::unique_ptr<RecFormulaRecognization> p_detector3_;

public:
    AccurateFormula() = delete;
    AccurateFormula(const std::string &interface_url, const crow::request &request);

public:
    static bool Init();
    void ProcessRequest(std::string &response);

private:
    TALError handler(Json::Value &result) override;

private:
    TALError VerifyRegFlag();
    // thread func for models
    static std::vector<regData> ModelFunc(std::vector<cv::Mat> cv_image, RecFormulaRecognization* detector);
};
