--[[
Name: init.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script is launched during nxgway initialization.
--]]

local common = require("common")
local auth = require("auth")
local waf = require("waf")

global_var_container = {}
global_var_container.waf_cookie_rule = waf:read_waf_rule("cookie")
global_var_container.waf_post_rule = waf:read_waf_rule("post")
global_var_container.waf_url_rule = waf:read_waf_rule("url")
global_var_container.waf_useragent_rule = waf:read_waf_rule("useragent")

global_var_container.waf_cookie_option = waf:read_waf_option("waf_check_cookie")
global_var_container.waf_post_option = waf:read_waf_option("waf_check_post")
global_var_container.waf_url_option = waf:read_waf_option("waf_check_url")
global_var_container.waf_useragent_option = waf:read_waf_option("waf_check_useragent")

package.loaded["common"] = common
package.loaded["auth"] = auth
package.loaded["waf"] = waf
