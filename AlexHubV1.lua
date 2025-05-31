-- Script: Alex Hub V1
-- Author: Alex Jhon Ponce

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Corner Rounding
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

-- Moving RGB Border
local FrameStroke = Instance.new("UIStroke")
FrameStroke.Thickness = 3
FrameStroke.Color = Color3.fromRGB(255, 0, 0) -- Initial color
FrameStroke.Parent = Frame

local StrokeGradient = Instance.new("UIGradient")
StrokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
})
StrokeGradient.Parent = FrameStroke

-- Animate RGB effect by rotating the gradient
spawn(function()
    while Frame.Parent do
        local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local tween = TweenService:Create(StrokeGradient, tweenInfo, {Rotation = 360})
        tween:Play()
        tween.Completed:Wait()
        StrokeGradient.Rotation = 0
    end
end)

-- Close Button
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -40, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
Close.Text = "×"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Font = Enum.Font.GothamBold
Close.Parent = Frame
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = Close
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0.05, 0)
Title.Text = "Alex Hub V1 - Code Entry"
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Frame

-- Instructions
local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, -20, 0, 30)
Instructions.Position = UDim2.new(0, 10, 0.2, 0)
Instructions.Text = "Enter Code to Unlock Hub"
Instructions.TextSize = 16
Instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
Instructions.BackgroundTransparency = 1
Instructions.Font = Enum.Font.SourceSansPro
Instructions.TextXAlignment = Enum.TextXAlignment.Center
Instructions.Parent = Frame

-- TextBox for Code Entry
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.15, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.35, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.PlaceholderText = "Enter Code..."
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSansPro
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 8)
TextBoxCorner.Parent = TextBox

local TextBoxStroke = Instance.new("UIStroke")
TextBoxStroke.Thickness = 1
TextBoxStroke.Color = Color3.fromRGB(255, 255, 255)
TextBoxStroke.Transparency = 0.5
TextBoxStroke.Parent = TextBox

-- Submit Button
local SubmitCode = Instance.new("TextButton")
SubmitCode.Size = UDim2.new(0.8, 0, 0.15, 0)
SubmitCode.Position = UDim2.new(0.1, 0, 0.55, 0)
SubmitCode.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SubmitCode.Text = "Submit Code"
SubmitCode.TextSize = 18
SubmitCode.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitCode.Font = Enum.Font.GothamBold
SubmitCode.Parent = Frame

local SubmitCodeCorner = Instance.new("UICorner")
SubmitCodeCorner.CornerRadius = UDim.new(0, 8)
SubmitCodeCorner.Parent = SubmitCode

-- Validation Function
local function validateCode(code)
    return code == "ALEXISGOODATCODING"
end

-- Submit Code Logic
SubmitCode.MouseButton1Click:Connect(function()
    local enteredCode = TextBox.Text
    if validateCode(enteredCode) then
        TextBox.Text = ""
        Instructions.Text = "Code Accepted! Loading..."
        Instructions.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1)
        ScreenGui:Destroy()

        -- Main Script (Alex Hub V1)
        local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
        local Window = OrionLib:MakeWindow({
            Name = "Alex Hub V1",
            HidePremium = false,
            SaveConfig = true,
            ConfigFolder = "OrionTest"
        })

        local Tab = Window:MakeTab({
            Name = "Main",
            Icon = "",
            PremiumOnly = false
        })

        Tab:AddButton({
            Name = "INF SPINS",
            Callback = function()
                print("button pressed")
                local args = {
                    "GiveSpin",
                    999
                }
                game:GetService("ReplicatedStorage"):WaitForChild("R_Server"):FireServer(unpack(args))
            end
        })

        Tab:AddButton({
            Name = "GIVE BEST EGG",
            Callback = function()
                print("button pressed")
                local args = {
                    "Get_EGG",
                    "Godzilla"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("R_Server"):FireServer(unpack(args))
            end
        })

    else
        Instructions.Text = "Invalid Code. Try Again."
        Instructions.TextColor3 = Color3.fromRGB(255, 50, 50)
        TextBox.Text = ""
        wait(1)
        Instructions.Text = "Enter Code to Unlock Hub"
        Instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
        TextBox.PlaceholderText = "Enter Code..."
    end
end)
