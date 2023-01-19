-- 计算生成的签名
function computeSign()
    -- 用户传递的接口参数
    local timestamp = ngx.req.get_uri_args()["timestamp"]
    if timestamp == nil then
        return ""
    end

    -- 前端传递的secret不能使用定义常量的方式, 而是通过一定的函数规则生成, 防止客户端代码被逆向解析出来
    local secret = "ngxway"

    -- sign = md5(md5("timestamp_secret_timestamp"))
    -- sign = 取sign的前[10, 25]位
    local k = string.format("%s_%s_%s", timestamp, secret, timestamp)
    local length = timestamp%16 + 10
    local sign = string.sub(ngx.md5(k), 0, length)
    ngx.log(ngx.ERR, sign, " = " , k)
    return sign
end

-- 校验签名
function checkSign()
    -- 用户传递的接口参数
    local sign = ngx.req.get_uri_args()["sign"]
    if sign == nil then
        return false
    end

    -- 生成真实的签名
    local realSign = computeSign()

    -- 比对签名是否一致
    if realSign ~= sign then
        return false
    end

    return true
end

-- 检查时间戳
function checkTimestamp()
    -- 用户传递的接口参数
    local timestamp = ngx.req.get_uri_args()["timestamp"]
    if timestamp == nil then
        return false
    end

    -- 如果时间戳相差在1小时内，则视为正常请求，否则视为恶意请求
    now = os.time()
    if math.abs(now - tonumber(timestamp)) > 3600 then
        return false
    end

    return true
end

-- 检查参数
function checkParams()
    -- 用户传递的接口参数
    local timestamp = ngx.req.get_uri_args()["timestamp"]
    local sign = ngx.req.get_uri_args()["sign"]
    if timestamp == nil or sign == nil then
        return false
    end

    return true
end

-- 如果session未空, 则检查请求签名是否合法
local session = ngx.req.get_uri_args()["session"]
if session == "" or session == nil then
    -- 检查参数是否都正常存在
    if checkParams() == false then
        ngx.log(ngx.ERR, 'check params failed')
        return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
    end

    -- 防止用户的重放攻击
    -- 所以如果时间戳与服务器相差较大, 则直接拒绝请求
    if checkTimestamp() == false then
        ngx.log(ngx.ERR, 'check timestamp failed')
        return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
    end

    -- 防止用户刷接口
    -- 所以如果签名校验失败, 则直接拒绝请求
    if checkSign() == false then
        ngx.log(ngx.ERR, 'check sign failed')
        return ngx.say('{"dm_error":4031,"error_msg":"check sign failed"}')
    end
end
