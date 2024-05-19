-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 3
local name = GetUIText(WINDOW_TITLE_TEXT, "bank")
local uic = UIC_BANK
local icon = "bag"
local badgeColor = ""
local CustomOnClick = function()
  ADDON:ShowContent(UIC_BANK, true)
  ADDON:ShowContent(UIC_BAG, true)
  ADDON:ToggleContent(UIC_SYSTEM_CONFIG_FRAME)
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