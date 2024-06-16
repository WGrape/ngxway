--[[
Name: waf.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script is Web Application Firewall(WAF).
--]]

waf = {}

local common = require("common")

-- read the rules of waf.
function waf:read_waf_rule(name)
  local path = "/dist/conf/waf/" .. name .. ".conf"
  local file = io.open(path, "r")
  if file == nil then
    return
  end

  local t = {}
  for line in file:lines() do
    table.insert(t, line)
  end

  file:close()
  return t
end

-- read the options of waf.
function waf:read_waf_option(key)
  local path = common.waf_config_path
  local file = io.open(path, "r")
  if file == nil then
    return ""
  end

  for line in file:lines() do
    local result = common:split(line, "=")
    if result[1] == key then
      return result[2]
    end
  end

  file:close()
  return ""
end

-- check the url is valid.
function waf:waf_check_url(uri, rule_list)
  local ngx_match = ngx.re.match
  for _, rule in pairs(rule_list) do
    if rule ~= "" and ngx_match(uri, rule, common.reg_match_mode) then
      ngx.log(ngx.ERR, "forbidden: waf_check_url = ", uri)
      return false
    end
  end
  return true
end

-- check the cookie is valid.
function waf:waf_check_cookie(cookie, rule_list)
  local ngx_match = ngx.re.match
  for _, rule in pairs(rule_list) do
    if rule ~= "" and ngx_match(cookie, rule, common.reg_match_mode) then
      ngx.log(ngx.ERR, "forbidden: waf_check_cookie = ", cookie)
      return false
    end
  end
  return true
end

-- check the useragent is valid.
function waf:waf_check_useragent(useragent, rule_list)
  local ngx_match = ngx.re.match
  for _, rule in pairs(rule_list) do
    if rule ~= "" and ngx_match(useragent, rule, common.reg_match_mode) then
      ngx.log(ngx.ERR, "forbidden: waf_check_useragent = ", useragent)
      return false
    end
  end
  return true
end

return waf
