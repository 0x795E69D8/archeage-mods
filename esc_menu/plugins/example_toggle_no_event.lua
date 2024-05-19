-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 5
local name = "Example Toggle"
local uic = 999999
local icon = "wiki"
local badgeColor = ""
local exampleToggleState = false
local CustomOnClick = function()
  exampleToggleState = not exampleToggleState
  X2:ChatLog(string.format("[ExamplePlugin] Example Toggle status: %s", tostring(exampleToggleState)))
end

return {
  info = {
    name = name,
    state = {
      isOn = function()
        return exampleToggleState
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