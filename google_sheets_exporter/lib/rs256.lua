--------------------------------------------------------------------------------------------------------------------------
-- rs256.lua
--------------------------------------------------------------------------------------------------------------------------
-- VERSION: 1 (2024-01-03)
-- AUTHOR:  Tamaki
--
-- DESCRIPTION:
--    This module contains functions to sign a message with an RSA private key modulus and exponent using RSASSA-PKCS1-V1_5-SIGN
--    (https://www.rfc-editor.org/rfc/rfc3447#section-8.2.1).
--    Made for Lua 5.1 to be used with CryEngine 3.
--
--
-- USAGE:
--    Input data should be provided as following:
--    K_modulus and K_exponent: string of decimal number value
--    M: string
--    k: number
--
--
-- CHANGELOG:
--  version     date      description
--  -------  ----------   -----------
--     1     2024-01-03   First release
-----------------------------------------------------------------------------

require("lib.BigNum")

local rs256 = {}

local const_0, const_1, const_2, const_256 = BigNum.new(0), BigNum.new(1), BigNum.new(2), BigNum.new(256)
local mul, quo, mod = BigNum.new(), BigNum.new(), BigNum.new()

-- transform the string representation of the sha256 hash into actual octets
local function StringToOctets(str)
    local octetString = {}
    for i = 1, str:len(), 2 do
        table.insert(octetString, string.char(tonumber(str:sub(i, i+1), 16)))
    end
    octetString = table.concat(octetString)
    return octetString
end

local function EmsaPkcs1V1_5Encode(M, emLen)
    --local H = StringToOctets(sha.sha256(M))
    local handle = io.popen(".\\lib\\helper sha256 "..M, "r")
    handle:flush()
    local H = StringToOctets(handle:read())
    handle:close()
    local digestAlg = string.char(0x30,0x31,0x30,0x0d,0x06,0x09,0x60,0x86,0x48,0x01,0x65,0x03,0x04,0x02,0x01,0x05,0x00,0x04,0x20)
    local T = digestAlg .. H
    local PS = {}
    for i = 1, emLen - T:len() - 3 do
        PS[i] = string.char(0xFF)
    end
    PS = table.concat(PS)
    local EM = table.concat({string.char(0x00,0x01), PS, string.char(0x00), T})
    return EM
end

local function OS2IP(X)
    local xLen = X:len()
    local x = BigNum.new(0)
    for i = 1, X:len() do
        local n = BigNum.new(xLen - i)
        local v = BigNum.new(string.byte(X, i))
        local pResult = BigNum.pow(const_256, n)
        BigNum.mul(pResult, v, mul)
        BigNum.add(x, mul, x)
    end
    return x
end

local function RSASP1(K_modulus, K_exponent, m)
    local handle = io.popen(".\\lib\\helper modpow "..tostring(m).." "..K_exponent.." "..K_modulus, "r")
    handle:flush()
    local s = BigNum.new(handle:read())
    handle:close()
    return s
end

local function I2OSP (s, k)
    local S = {}
    local i = 0
    while (BigNum.lt(const_0, s) and i < k) do
        BigNum.div(s, const_256, quo, mod)
        BigNum.change(s, quo)
        table.insert(S, string.char(tonumber(tostring(mod))))
    end
    return table.concat(S):reverse()
end

function rs256.RsassaPkcs1V1_5Sign(K_modulus, K_exponent, M, k)
    local EM = EmsaPkcs1V1_5Encode(M, k)
    local m = OS2IP(EM)
    local s = RSASP1(K_modulus, K_exponent, m)
    local S = I2OSP(s, k)
    return S
end

return rs256
