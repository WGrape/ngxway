-- Compute the signature of request url.
function computeSign()
    -- The params passed by the user.
    local timestamp = ngx.req.get_uri_args()["timestamp"]
    if timestamp == nil then
        return ""
    end

    -- The secret passed by the front end cannot be defined by constants, but generated by certain function rules to prevent the client code from being reversely parsed.
    local secret = "ngxway"

    -- sign = md5(md5("timestamp_secret_timestamp"))
    -- sign = Take the first [10, 25] bits of sign.
    local k = string.format("%s_%s_%s", timestamp, secret, timestamp)
    local length = timestamp%16 + 10
    local sign = string.sub(ngx.md5(k), 0, length)
    return sign
end

-- Check the url signature is right.
function checkSign()
    -- The params passed by the user.
    local sign = ngx.req.get_uri_args()["sign"]
    if sign == nil then
        return false
    end

    -- Generate real signatures.
    local realSign = computeSign()

    -- Check whether the signatures are consistent.
    if realSign ~= sign then
        return false
    end

    return true
end

-- Check the timestamp is valid.
function checkTimestamp()
    -- The timestamp param passed by the user.
    local timestamp = ngx.req.get_uri_args()["timestamp"]
    if timestamp == nil then
        return false
    end

    -- If the timestamp difference is within 1 hour, it is considered a normal request, otherwise it is considered a malicious request.
    now = os.time()
    if math.abs(now - tonumber(timestamp)) > 3600 then
        return false
    end

    return true
end

-- Check params
function checkParams()
    -- The params passed by the user.
    local timestamp = ngx.req.get_uri_args()["timestamp"]
    local sign = ngx.req.get_uri_args()["sign"]
    if timestamp == nil or sign == nil then
        return false
    end

    -- Check the timestamp is valid.
    local theNumber = tonumber(timestamp);
    if theNumber == nil then
        return false
    end

    return true
end

-- If the session is not empty, check whether the request signature is legal.
local session = ngx.req.get_uri_args()["session"]
if session == "" or session == nil then
    -- Check whether the parameters are normal.
    if checkParams() == false then
        ngx.log(ngx.ERR, 'check params failed')
        return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
    end

    -- Prevent user recall attacks.
    -- So if the timestamp differs greatly from the server, the request is rejected directly.
    if checkTimestamp() == false then
        ngx.log(ngx.ERR, 'check timestamp failed')
        return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
    end

    -- Prevent users from swiping the api.
    -- So if the signature verification fails, the request is rejected directly.
    if checkSign() == false then
        ngx.log(ngx.ERR, 'check sign failed')
        return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
    end
end
