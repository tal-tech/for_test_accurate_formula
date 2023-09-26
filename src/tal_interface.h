#pragma once


#include "crow_all.h"
#include "service_error.h"
#include "json/json.h"
#include "data_flow.h"

#include <string>
#include <atomic>
#include <malloc.h>
#include <functional>


class TALInterface {
protected:
    static std::string app_name_;
    static std::string app_version_;

protected:
    const std::string interface_url_;
    const crow::request &request_;
    const std::string &request_body_;
    Json::Value request_body_json_;
    std::string request_id_;
    std::string app_key_;

private:
    static std::atomic_int trim_count_;

public:
    TALInterface() = delete;
    TALInterface(const std::string &interface_url, const crow::request &request) :
        interface_url_{interface_url}, 
        request_{request}, 
        request_body_{request.body} {
            request_id_ = GetURLParamValue(data_request_id);
            app_key_ = GetURLParamValue(data_appkey);
    }
    TALInterface(const TALInterface &) = default;
    TALInterface &operator=(TALInterface &) = default;
    TALInterface(TALInterface &&) = default;
    TALInterface &operator=(TALInterface &&) = default;
    virtual ~TALInterface() {}

public:
    static inline void SetAppName(const std::string app_name);
    static inline void SetAppVersion(const std::string app_version);

protected:
    inline std::string GetURLParamValue(const std::string &param_name);
    inline void MallocTrim();

    TALError ParseRequestBody();
};

void TALInterface::SetAppName(const std::string app_name) {
    app_name_ = app_name;
}

void TALInterface::SetAppVersion(const std::string app_version) {
    app_version_ = app_version;
}

std::string TALInterface::GetURLParamValue(const std::string &param_name) {
    char *temp = nullptr;
    if ((temp = request_.url_params.get(param_name))) {
        return temp;
    }
    return "";
}

void TALInterface::MallocTrim() {
    if (++trim_count_ % 1000 == 0) {
        malloc_trim(0);
        trim_count_ = 0;
    }
}
