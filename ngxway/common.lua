--[[
Name: common.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script provide some common functions.
--]]

local common = {}

common.waf_config_path = "/dist/conf/waf/waf.conf"

-- Provide the split function.
function common:split(str, sep)
  local result = {}
  for token in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(result, token)
  end
  return result
end

return common
