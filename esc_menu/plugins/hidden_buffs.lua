-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 5
local name = "Hidden Buffs"
local uic = 42069
local icon = "lock"
local badgeColor = ""
local buffToggleState = false
local CustomOnClick = function()
  buffToggleState = not buffToggleState
  ADDON:ToggleContent(42069)
end

return {
  info = {
    name = name,
    state = {
      isOn = function()
        return buffToggleState
      end
    }
  },
  menu = {
    badgeColorKey = badgeColor,
    iconKey = icon,
    uiContentType = uic,
  },
  category = category,
  CustomOnClick = CustomOnClick
}