-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 5
local name = "Example Menu Entry"
local uic = 999998
local icon = "wiki"
local badgeColor = ""
local CustomOnClick = function()
  X2:ChatLog("[ExamplePlugin] This is a custom function attached to the example plugin")
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