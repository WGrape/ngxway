local method = ngx.req.get_method()
local uri = ngx.var.uri
local common_module = require("common_module")

if common_module:waf_check_url(uri) == false then
  return ngx.say('{"dm_error":4032,"error_msg":"waf check url failed"}')
end
