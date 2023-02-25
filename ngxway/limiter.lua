--[[
Name: limiter.lua
Author: WGrape
Copyright: (c) WGrape, 2022
License: MIT License
Description: This lua script is traffic limiter module.
--]]

local limiter = {}

-- https://github.com/openresty/lua-resty-limit-traffic
-- https://www.google.com.hk/search?q=req.lua%3A7%3A+module+%27ffi%27+not+found
local limit_req = require "resty.limit.req"

function limiter:check()

  -- limit the requests under 200 req/sec with a burst of 100 req/sec,
  -- that is, we delay requests under 300 req/sec and above 200
  -- req/sec, and reject any requests exceeding 300 req/sec.
  -- You can set limit_req.new("ngxway_limiter_store", 2, 1) to test.
  local lim, err = limit_req.new("ngxway_limiter_store", 200, 100)
  if not lim then
    ngx.log(ngx.ERR, "failed to instantiate a resty.limit.req object: ", err)
    return 500
  end

  -- the following call must be per-request.
  -- here we use the remote (IP) address as the limiting key
  local key = ngx.var.binary_remote_addr
  local delay, err = lim:incoming(key, true)
  if not delay then
    if err == "rejected" then
      ngx.log(ngx.ERR, "incoming rejected: ", err)
      return 503
    end

    ngx.log(ngx.ERR, "incoming error: ", err)
    return 500
  end

  if delay >= 0.001 then
    -- the 2nd return value holds the number of excess requests
    -- per second for the specified key. for example, number 31
    -- means the current request rate is at 231 req/sec for the
    -- specified key.
    local excess = err

    -- the request exceeding the 200 req/sec but below 300 req/sec,
    -- so we intentionally delay it here a bit to conform to the
    -- 200 req/sec rate.
    ngx.sleep(delay)
  end
  return 200

end

return limiter
