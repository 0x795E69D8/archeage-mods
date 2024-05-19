-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 5
local name = "Export Auction Prices"
local uic = 0x6355524c
local icon = "wiki"
local badgeColor = ""

-- mod config
local price_config = "dailyAvg"
local spreadsheetId = "00000000000000000000000000000000000000000000"
local sheetId = "Prices"
local service_account = "00000000@000000000000000000000000000000000000000000"
local private_key_id = "0000000000000000000000000000000000000000"
local private_key_modulus = "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
local private_key_exponent = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"

-- code
local access_token = nil
local auth_time = nil
local base64 = require("lib.base64")
local rs256 = require("lib.rs256")

local function authenticate(now)
  auth_time = now
  local iat = tostring(now)
  local exp = tostring(now+3600)
  local header = table.concat({"{\"alg\":\"RS256\",\"typ\":\"JWT\",\"kid\":\"", private_key_id, "\"}"})
  local claim_set = table.concat({"{\"iss\":\"", service_account, "\",\"scope\":\"https://www.googleapis.com/auth/spreadsheets\",\"aud\":\"https://oauth2.googleapis.com/token\",\"exp\":", exp, ",\"iat\":", iat, "}"})
  header = base64.enc(header):gsub("=","")
  claim_set = base64.enc(claim_set):gsub("=","")
  local M = table.concat({header, ".", claim_set})
  local signature = rs256.RsassaPkcs1V1_5Sign(private_key_modulus, private_key_exponent, M, 256)
  signature = base64.enc(signature):gsub("=","")
  local jwt = table.concat({M, ".", signature})
  local command = table.concat({"curl --silent https://oauth2.googleapis.com/token -d \"grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=", jwt, "\""})
  local responseStream = io.popen(command, "r")
  responseStream:flush()
  access_token = responseStream:read()
  responseStream:close()
  access_token = access_token:gsub("{\"access_token\":\"","")
  access_token = string.sub(access_token, 1, string.find(access_token, "\",\"expires_in\"") - 1)
end

local function readSheet()
  local command = table.concat({"curl --silent https://sheets.googleapis.com/v4/spreadsheets/", spreadsheetId, "/values/", sheetId, "!A2:C1000?access_token=", access_token})
  local sheet = io.popen(command, "r")
  sheet:flush()
  local items = {}
  local itemNumber = 1
  local readNext = 0
  for line in sheet:lines() do
    if readNext > 0 then
      if readNext == 2 then
        table.insert(items, {})
        items[itemNumber]["item"] = tonumber(string.sub(line, 8, string.find(line, "\"[^\"]*$") - 1))
      elseif readNext == 1 then
        items[itemNumber]["grade"] = tonumber(string.sub(line, 8, string.find(line, "\"[^\"]*$") - 1))
        itemNumber = itemNumber + 1
      end
      readNext = readNext - 1
    end
    if readNext == 0 and line == "    [" then
      readNext = 2
    end
  end
  sheet:close()
  return items
end

local itemNumber = 0
local itemValueList = nil

local CustomOnClick = function()
  local now = os.time(os.date("*t"))
  if access_token == nil or now - auth_time > 3600 then
    authenticate(now)
  end
  local items = readSheet()
  itemNumber = #items
  for i, v in pairs(items) do
    X2Auction:AskMarketPrice(v["item"], v["grade"], false)
  end
end

local function auctionCallback(itemName, itemGrade, askMarketPriceUi, values)
  if itemNumber > 0 then
    X2:ChatLog(string.format("auctionCallback %d", itemNumber))
    X2:ChatLog(itemValueList)
    itemNumber = itemNumber - 1
    if itemValueList ~= nil then
      itemValueList = table.concat({itemValueList, ",", tostring(values[14][price_config])})
    else
      itemValueList = tostring(values[14][price_config])
    end
  end
  if itemNumber == 0 and itemValueList ~= nil then
    local command = table.concat({"curl --silent -X PUT -H \"Content-Type: application/json\" -H \"Authorization: Bearer ", access_token, "\" -d \"{\\\"range\\\":\\\"Prices!D2:D1000\\\",\\\"majorDimension\\\":\\\"COLUMNS\\\",\\\"values\\\":[[", itemValueList, "]]}\" https://sheets.googleapis.com/v4/spreadsheets/", spreadsheetId, "/values/", sheetId, "!D2:D1000?valueInputOption=USER_ENTERED"})
    local responseStream = io.popen(command, "r")
    responseStream:close()
    itemValueList = nil
  end
end

UIParent:SetEventHandler("DIAGONAL_ASR", auctionCallback)

return {
  info = {
    name = name
  },
  menu = {
    badgeColorKey = badgeColor,
    iconKey = icon,
    uiContentType = uic,
  },
  category = category,
  CustomOnClick = CustomOnClick
}