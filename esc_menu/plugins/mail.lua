-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 3
local name = GetUIText(WINDOW_TITLE_TEXT, "mail")
local uic = UIC_MAIL
local icon = "mail"
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
    hotkey = toggle_mail
  },
  category = category,
  CustomOnClick = CustomOnClick
}