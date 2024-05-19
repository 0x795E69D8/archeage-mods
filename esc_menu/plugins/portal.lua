local tpName = "Custom" -- name your custom TP gets saved as
local tpBookId = 4045 -- item ID of whatever TP book you have in your inventory (4045 is default one)
-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 5
local name = "Save Portal"
local uic = 999999
local icon = "tgos"
local badgeColor = ""
local CustomOnClick = function()
  X2Warp:SavePortal(tpName, tpBookId)
end

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