--[[
Name: common.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script is worked for access_by_lua_file directive.
--]]

local cache_key = ngx.var.scheme .. ngx.var.request_method .. ngx.var.host .. ngx.var.request_uri
local cache_status = ngx.shared.ngxway_main_store:get(cache_key)
if cache_status == "HIT" then
  return
end

local auth = require("auth")
local waf = require("waf")

-- Debug
-- ngx.log(ngx.ERR, 'main.lua init')

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

ngx.shared.ngxway_main_store:set(cache_key, "HIT", 60)
