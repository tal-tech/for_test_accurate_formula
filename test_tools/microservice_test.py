import json
import time
from com.tal.ailab.util.send_sign_http import send_request

# App 信息
access_key_id = '4326400839042048'
access_key_secret = '70ec636a07b24db889fe0df0be98dfeb'

# 请求url，此处自动加入参数
url = 'http://10.25.155.4:8888/automatic-box?'
request_method = 'POST'

anchor = [1, 2]
body_params = {
    "image_base64": image_base64,
    "anchor": anchor
}

application_json = 'application/json'
content_type = application_json

headers = {
    'content-type': content_type
}

timestamp = time.strftime("%Y-%m-%dT%H:%M:%S", time.localtime())

url_params = {}

result = send_request(access_key_id,
                      access_key_secret,
                      timestamp, 
                      url,
                      url_params,
                      body_params,
                      request_method,
                      content_type)
print(result)
