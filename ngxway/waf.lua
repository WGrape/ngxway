--[[
Name: waf.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script is Web Application Firewall(WAF).
--]]

waf = {}

local common = require("common")

-- Read the rules of waf.
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

-- Read the options of waf.
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

-- Check the url of waf.
function waf:waf_check_url(uri, rule_list)
  local ngx_match = ngx.re.match
  for _, rule in pairs(rule_list) do
    if rule ~= "" and ngx_match(uri, rule, "isjo") then
      ngx.log(ngx.ERR, "forbidden: waf_check_url")
      return false
    end
  end
  return true
end

return waf
