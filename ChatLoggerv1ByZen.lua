local gui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local uiCorner = Instance.new("UICorner")
local uiGradient = Instance.new("UIGradient")
local uiPadding = Instance.new("UIPadding")
local title = Instance.new("TextLabel")
local chatScroll = Instance.new("ScrollingFrame")
local listLayout = Instance.new("UIListLayout")
local uiScale = Instance.new("UIScale")
local closeBtn = Instance.new("TextButton")
local ts = game:GetService("TweenService")

gui.Name = "ChatLogger"
gui.Parent = game:GetService("CoreGui")

mainFrame.Active = true
mainFrame.Selectable = true
mainFrame.Draggable = true

mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 330, 0, 260)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.8, 0, 0.7, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)

uiCorner.CornerRadius = UDim.new(0, 18)
uiCorner.Parent = mainFrame

uiGradient.Parent = mainFrame
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 110, 220)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 50, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 40))
}
uiGradient.Rotation = 155

uiPadding.Parent = mainFrame
uiPadding.PaddingTop = UDim.new(0, 14)
uiPadding.PaddingBottom = UDim.new(0, 11)
uiPadding.PaddingLeft = UDim.new(0, 12)
uiPadding.PaddingRight = UDim.new(0, 12)

uiScale.Parent = mainFrame
uiScale.Scale = 0.95

closeBtn.Parent = mainFrame
closeBtn.Size = UDim2.new(0,23,0,23)
closeBtn.Position = UDim2.new(1,-27,0,3)
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 15
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
closeBtn.BackgroundTransparency = 0.12
closeBtn.ZIndex = 10
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0,10)
closeCorner.Parent = closeBtn
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

title.Parent = mainFrame
title.Size = UDim2.new(1,0,0,22)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 18
title.Text = "💬 Better Chat Logger"
title.TextXAlignment = Enum.TextXAlignment.Left

chatScroll.Parent = mainFrame
chatScroll.Size = UDim2.new(1,0,1,-44)
chatScroll.Position = UDim2.new(0,0,0.13,0)
chatScroll.BackgroundTransparency = 1
chatScroll.CanvasSize = UDim2.new(0,0,0,0)
chatScroll.ScrollBarThickness = 5

listLayout.Parent = chatScroll
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0,7)

local ti = TweenInfo.new(1.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
ts:Create(uiScale, ti, {Scale = 1}):Play()

local function AddChatCard(msg, username, iconImageId, timeText)
    local card = Instance.new("Frame")
    card.Parent = chatScroll
    card.Size = UDim2.new(1,0,0,41)
    card.BackgroundColor3 = Color3.fromRGB(38,38,53)
    card.LayoutOrder = chatScroll.AbsoluteCanvasSize.Y
    card.Transparency = 1

    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = card

    local cardGradient = Instance.new("UIGradient")
    cardGradient.Parent = card
    cardGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(85,120,200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(38,38,53))
    }
    cardGradient.Rotation = 145

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Parent = card
    cardStroke.Color = Color3.fromRGB(100, 200, 255)
    cardStroke.Thickness = 0
    cardStroke.Transparency = 0.6

    local avatar = Instance.new("ImageLabel")
    avatar.Parent = card
    avatar.Size = UDim2.new(0, 24, 0, 24)
    avatar.Position = UDim2.new(0, 5, 0, 9)
    avatar.BackgroundTransparency = 1
    avatar.Image = (iconImageId and ("rbxthumb://type=AvatarHead&id="..tostring(iconImageId)) or "rbxassetid://15681959700")

    local userLabel = Instance.new("TextLabel")
    userLabel.Parent = card
    userLabel.Size = UDim2.new(0, 85, 0, 13)
    userLabel.Position = UDim2.new(0, 32, 0, 2)
    userLabel.BackgroundTransparency = 1
    userLabel.Text = "@"..(username or "Guest").." | "..(timeText or os.date("%H:%M"))
    userLabel.Font = Enum.Font.GothamBold
    userLabel.TextColor3 = Color3.fromRGB(158,204,255)
    userLabel.TextSize = 10
    userLabel.TextXAlignment = Enum.TextXAlignment.Left

    local chatText = Instance.new("TextLabel")
    chatText.Parent = card
    chatText.Size = UDim2.new(1, -110, 0, 21)
    chatText.Position = UDim2.new(0, 104, 0, 13)
    chatText.BackgroundTransparency = 1
    chatText.Text = msg
    chatText.TextWrapped = true
    chatText.Font = Enum.Font.Gotham
    chatText.TextColor3 = Color3.fromRGB(245,250,255)
    chatText.TextSize = 13
    chatText.TextXAlignment = Enum.TextXAlignment.Left

    local copyBtn = Instance.new("TextButton")
    copyBtn.Parent = card
    copyBtn.Size = UDim2.new(0,19,0,19)
    copyBtn.Position = UDim2.new(1,-24,0,10)
    copyBtn.BackgroundColor3 = Color3.fromRGB(63, 209, 158)
    copyBtn.Text = "⧉"
    copyBtn.Font = Enum.Font.Gotham
    copyBtn.TextSize = 12
    copyBtn.TextColor3 = Color3.fromRGB(17,32,26)
    copyBtn.BorderSizePixel = 0
    copyBtn.BackgroundTransparency = 0.10

    local copyCorner = Instance.new("UICorner")
    copyCorner.CornerRadius = UDim.new(0,7)
    copyCorner.Parent = copyBtn

    copyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(msg)
        end
        copyBtn.Text = "✔"
        copyBtn.TextColor3 = Color3.fromRGB(70,150,100)
        wait(0.9)
        copyBtn.Text = "⧉"
        copyBtn.TextColor3 = Color3.fromRGB(17,32,26)
    end)

    cardStroke.Thickness = 3
    ts:Create(card, TweenInfo.new(0.53, Enum.EasingStyle.Quad), {Transparency=0}):Play()
    ts:Create(cardStroke, TweenInfo.new(1.2, Enum.EasingStyle.Quad), {Thickness=0, Transparency=1}):Play()

    chatScroll.CanvasSize = UDim2.new(0,0,0,chatScroll.UIListLayout.AbsoluteContentSize.Y + 10)
    local sTween = ts:Create(chatScroll, TweenInfo.new(0.55, Enum.EasingStyle.Quad), {CanvasPosition = Vector2.new(0, chatScroll.CanvasSize.Y.Offset)})
    sTween:Play()
end

local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        AddChatCard(msg, plr.Name, plr.UserId)
    end)
end)
for _,plr in ipairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        AddChatCard(msg, plr.Name, plr.UserId)
    end)
end
