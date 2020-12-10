---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by huifer.
--- DateTime: 2020/12/10 13:16
---


local http = require("socket.http")
local ltn12 = require("ltn12")

httpUtils = {}

function http.delete(u)
    local t = {
    }
    local r, c, h = http.request {
        url = u,
        sink = ltn12.sink.table(t),
        method = "DELETE",
    }
    return r, c, h, table.concat(t)
end

function http.get(u)
    local t = {
    }
    local r, c, h = http.request {
        url = u,
        sink = ltn12.sink.table(t) }
    return r, c, h, table.concat(t)
end

function http.post(u)
    local t = {
    }
    local r, c, h = http.request {
        url = u,
        sink = ltn12.sink.table(t),
        method = "POST",
    }
    return r, c, h, table.concat(t)
end

-- 发送http.get请求，返回响应结果
function httpUtils.wb_getUrl(url)
    r, c, h, body = http.get(url)
    if c ~= 200 then
        print("ErrorCode: " .. c .. "ErrorMessage:" .. body)
        return
    else
        return body
    end
end

function httpUtils.wb_postUrl(url)
    r, c, h, body = http.post(url)
    if c ~= 200 then
        print("ErrorCode: " .. c .. "ErrorMessage:" .. body)
        return
    else
        return body
    end
end



return httpUtils

