-- categories: 1 = Characters, 2 = Combat, 3 = Shop/QoL, 4 = Vocation, 5 = System
local category = 5
local name = "Advanced Settings"
local uic = 0x1337
local icon = "dairy"
local badgeColor = ""
-- setting list that gets shown in the bookmark window in game
cvarBookmarks = {
  "e_max_view_dst", -- environment render distance
  "r_FogDensityScale", -- distant fog
  "e_view_dist_ratio",
  "e_view_dist_ratio_detail",
  "e_terrain_texture_lod_ratio",
  "e_phys_foliage", -- plant physics etc
  "name_tag_mark_size_ratio", -- mark size
  "name_tag_text_line_offset",
  "name_tag_hp_width_on_bgmode",
  "name_tag_hp_height_on_bgmode",
  "e_custom_max_clone_model_5", -- player render cap for optimization mode (stage 5)
  "name_tag_fade_out_margin" -- name tag fadeout modifier
}
-- window
consoleWindow = CreateWindow("consoleWindow", "UIParent")
consoleWindow:SetExtent(F_PREFIX_SIZE:GetWindowWidth(WINDOW_WIDTH_510), 524)
consoleWindow:AddAnchor("CENTER", "UIParent", "CENTER", 0, 0)
consoleWindow:SetCloseOnEscape(true)
-- tabs
local tabTexts = {
  "Bookmarks",
  "Console"
}
local tab = W_TAB.CreateTab("tab", consoleWindow)
tab:AddTabs(tabTexts)
tabHeight = tab:GetHeight()
-- tab 1
local cvarEdits = {}
local offset = 20
for k, v in pairs(cvarBookmarks) do
  cvarEdits[v] = W_CTRL.CreateEdit(v, consoleWindow.tab.window[1])
  cvarEdits[v]:SetWidth(200)
  cvarEdits[v]:AddAnchor("TOPLEFT", consoleWindow.tab.window[1], consoleWindow.tab.window[1]:GetWidth() / 2 + 5, offset)
  local cvarLabel = consoleWindow.tab.window[1]:CreateChildWidget("label", "cvarLabel", k, true)
  cvarLabel:SetAutoResize(true)
  cvarLabel.style:SetColorByKey("black")
  cvarLabel:SetText(v)
  cvarLabel:AddAnchor("TOPLEFT", consoleWindow.tab.window[1], 5, offset + cvarEdits[v]:GetHeight() / 2)
  offset = offset + cvarEdits[v]:GetHeight() + 5
  if offset + cvarEdits[v]:GetHeight() + 5 > tab:GetHeight() then
    consoleWindow:SetHeight(consoleWindow:GetHeight() + cvarEdits[v]:GetHeight() + 5)
  end
end
local cvarApplyButton = consoleWindow.tab.window[1]:CreateChildWidget("button", "cvarApplyButton", 0, true)
cvarApplyButton:SetStyle("text_default")
cvarApplyButton:AddAnchor("BOTTOM", consoleWindow.tab.window[1], "BOTTOM", 0, 0)
cvarApplyButton:SetText("Apply")
function cvarApplyButton:OnClick(arg)
  for k, v in pairs(cvarEdits) do
    if Console:GetAttribute(k) ~= v:GetText() then
      Console:ExecuteString(string.format("%s %s", k, v:GetText()))
      v:SetText(Console:GetAttribute(k))
    end
  end
end
cvarApplyButton:SetHandler("OnClick", cvarApplyButton.OnClick)
if offset >= tabHeight - 31 then
  consoleWindow:SetHeight(consoleWindow:GetHeight() + cvarApplyButton:GetHeight() + 5)
end
-- tab 2
-- toggles
local consoleToggle = CreateCheckButton("consoleToggle", consoleWindow.tab.window[2])
consoleToggle:AddAnchor("TOPLEFT", consoleWindow.tab.window[2], 5, 20)
consoleToggle:SetChecked(Console:GetAttribute("con_display_last_messages") ~= "0", false)
function consoleToggle:CheckBtnCheckChagnedProc(checked)
  local console_state = Console:GetAttribute("con_display_last_messages")
  if checked and console_state == "0" then
    Console:ExecuteString("con_display_last_messages 1")
  elseif not checked and console_state ~= "0" then
    Console:ExecuteString("con_display_last_messages 0")
  end
end
local consoleToggleLabel = consoleWindow.tab.window[2]:CreateChildWidget("label", "consoleToggleLabel", 0, true)
consoleToggleLabel:SetAutoResize(true)
consoleToggleLabel.style:SetColorByKey("black")
consoleToggleLabel:SetText("display console log")
consoleToggleLabel:AddAnchor("LEFT", consoleToggle, "RIGHT", 5, 0)
local infoToggle = CreateCheckButton("infoToggle", consoleWindow.tab.window[2])
infoToggle:AddAnchor("TOPLEFT", consoleWindow.tab.window[2], tab:GetWidth() / 2 + 5, 20)
infoToggle:SetChecked(Console:GetAttribute("r_DisplayInfo") ~= "0", false)
function infoToggle:CheckBtnCheckChagnedProc(checked)
  local info_state = Console:GetAttribute("r_DisplayInfo")
  if checked and info_state == "0" then
    Console:ExecuteString("r_DisplayInfo 1")
  elseif not checked and info_state ~= "0" then
    Console:ExecuteString("r_DisplayInfo 0")
  end
end
local infoToggleLabel = consoleWindow.tab.window[2]:CreateChildWidget("label", "infoToggleLabel", 0, true)
infoToggleLabel:SetAutoResize(true)
infoToggleLabel.style:SetColorByKey("black")
infoToggleLabel:SetText("display additional information")
infoToggleLabel:AddAnchor("LEFT", infoToggle, "RIGHT", 5, 0)
-- console input
consoleEdit = W_CTRL.CreateEdit("consoleEdit", consoleWindow.tab.window[2])
consoleEdit:SetInset(5, 9, 25, 8)
consoleEdit:SetWidth(consoleWindow:GetWidth() - 20)
consoleEdit:AddAnchor("BOTTOM", consoleWindow.tab.window[2], 0, 0)
consoleEdit:ClearTextOnEnter(true)
consoleEdit:SetHistoryLines(50)
consoleEdit.bg:SetTextureColor("gm_default")
-- console log
consoleLog = consoleWindow.tab.window[2]:CreateChildWidget("message", "consoleLog", 0, true)
consoleLog:SetMaxLines(100)
consoleLog.style:SetAlign(ALIGN_LEFT)
consoleLog:SetLineSpace(TEXTBOX_LINE_SPACE.SMALL)
consoleLog:SetTimeVisible(3000)
consoleLog:AddAnchor("TOP", consoleToggle, "BOTTOM", 0, 10)
consoleLog:AddAnchor("BOTTOMLEFT", consoleEdit, "TOPLEFT", 2, -5)
consoleLog:AddAnchor("BOTTOMRIGHT", consoleEdit, "TOPRIGHT", -2, -5)
consoleLog:UseResizing(true)
local consoleBg = consoleLog:CreateColorDrawableByKey("login_stage_black_bg", "background")
consoleBg:AddAnchor("TOPLEFT", consoleLog, 0, 0)
consoleBg:AddAnchor("BOTTOMRIGHT", consoleLog, 0, 0)
-- event handler to log CONSOLE_WRITE events to the log widget, does nothing at the moment, might only work with X2Gm:ExecuteConsoleCommand()?
function consoleWindow:OnEvent(event, logType, log)
  if event == "CONSOLE_WRITE" and showConsole then
    logType = string.gsub(logType, "$6", F_COLOR.GetColor("battlefield_yellow", true))
    logType = string.gsub(logType, "$8", F_COLOR.GetColor("mustard_yellow", true))
    logType = string.gsub(logType, "$4", F_COLOR.GetColor("battlefield_yellow", true))
    consoleLog:AddMessage(logType)
  end
end
consoleWindow:SetHandler("OnEvent", consoleWindow.OnEvent)
consoleWindow:RegisterEvent("CONSOLE_WRITE")
local OnWheelUp = function()
  consoleLog:ScrollUp()
end
consoleLog:SetHandler("OnWheelUp", OnWheelUp)
local OnWheelDown = function()
  consoleLog:ScrollDown()
end
consoleLog:SetHandler("OnWheelDown", OnWheelDown)
local redHexColor = F_COLOR.GetColor("red", true)
local greenHexColor = F_COLOR.GetColor("green", true)
local yellowHexColor = F_COLOR.GetColor("mustard_yellow", true)
local function OnEnterPressed()
  local cmdText = consoleEdit:GetText()
  consoleEdit:AddHistoryLine(cmdText)
  if cmdText == "ui_reload" then
    consoleLog:AddMessage(string.format("%sCannot use ui_reload on this window!", redHexColor)) -- ui_reload crashes the game
    return
  end
  consoleLog:AddMessage(cmdText)
  Console:ExecuteString(cmdText)
  consoleLog:ScrollToBottom()
end
consoleEdit:SetHandler("OnEnterPressed", OnEnterPressed)
local OnEscapePressed = function()
  if consoleEdit:GetText() ~= "" then
    consoleEdit:SetText("")
  else
    consoleEdit:ClearFocus()
  end
end
consoleEdit:SetHandler("OnEscapePressed", OnEscapePressed)
local function OnKeyDown(self, arg)
  if arg == "pageup" then
    consoleLog:ScrollUp()
  end
  if arg == "pagedown" then
    consoleLog:ScrollDown()
  end
end
consoleEdit:SetHandler("OnKeyDown", OnKeyDown)
function UpdateAllEdits()
  for k, v in pairs(cvarEdits) do
    if Console:GetAttribute(k) ~= v:GetText() then
      v:SetText(Console:GetAttribute(k))
    end
  end
end
function ToggleConsoleWindow()
  local isVisible = consoleWindow:IsVisible()
  consoleWindow:Show(not isVisible)
  if not isVisible then
    UpdateAllEdits()
  end
end
ADDON:RegisterContentTriggerFunc(0x1337, ToggleConsoleWindow)

return {
  info = {
    name = name
  },
  menu = {
    badgeColorKey = badgeColor,
    iconKey = icon,
    uiContentType = uic,
  },
  category = category
}