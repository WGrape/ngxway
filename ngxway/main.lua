--[[
Name: common.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script is worked for access_by_lua_file directive.
--]]

local auth = require("auth")
local waf = require("waf")

if global_var_container.waf_url_option == "on" then
  local uri = ngx.var.uri
  if waf:waf_check_url(uri, global_var_container.waf_url_rule) == false then
    return ngx.say('{"dm_error":4032,"error_msg":"check waf failed"}')
  end
end

if global_var_container.waf_cookie_option == "on" then
  local cookie = ngx.var.http_cookie
  if waf:waf_check_cookie(cookie, global_var_container.waf_cookie_rule) == false then
    return ngx.say('{"dm_error":4032,"error_msg":"check waf failed"}')
  end
end

if global_var_container.waf_useragent_option == "on" then
  local useragent = ngx.var.http_user_agent
  if waf:waf_check_useragent(useragent, global_var_container.waf_useragent_rule) == false then
    return ngx.say('{"dm_error":4032,"error_msg":"check waf failed"}')
  end
end

if auth:check_auth() == false then
  return ngx.say('{"dm_error":4031,"error_msg":"check auth failed"}')
end
