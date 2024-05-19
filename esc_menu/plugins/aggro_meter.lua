-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 2
local name = "Aggro Meter"
local uic = 1330
local icon = "wiki"
local badgeColor = ""
local CustomOnClick = nil

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