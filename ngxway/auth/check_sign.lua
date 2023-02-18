local common_module = require("common_module")
local now_time = os.time()
local sign = ngx.var.arg_sign
local session = ngx.var.arg_session
local timestamp_string = ngx.var.arg_timestamp
local timestamp_number = tonumber(timestamp_string)

-- If the session is not empty, check whether the request signature is legal.
if session == "" or session == nil then
  -- Check whether the parameters are normal.
  if common_module:check_params(sign, timestamp_string, timestamp_number) == false then
    ngx.log(ngx.ERR, 'check params failed')
    return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
  end

  -- Prevent users from swiping the api.
  -- So if the signature verification fails, the request is rejected directly.
  if common_module:check_sign(sign, timestamp_string, timestamp_number) == false then
    ngx.log(ngx.ERR, 'check sign failed')
    return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
  end

  -- Prevent user recall attacks.
  -- So if the timestamp differs greatly from the server, the request is rejected directly.
  if common_module:check_timestamp(now_time, timestamp_number) == false then
    ngx.log(ngx.ERR, 'check timestamp failed')
    return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
  end

end
