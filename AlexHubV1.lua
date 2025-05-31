-- Script: Alex Hub V1
-- Author: Alex Jhon Ponce

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 450, 0, 350)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Gradient Background
local FrameGradient = Instance.new("UIGradient")
FrameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 60))
})
FrameGradient.Rotation = 45
FrameGradient.Parent = Frame

-- Corner Rounding
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame

-- Shadow Effect
local FrameStroke = Instance.new("UIStroke")
FrameStroke.Thickness = 2
FrameStroke.Color = Color3.fromRGB(0, 0, 0)
FrameStroke.Transparency = 0.7
FrameStroke.Parent = Frame

-- Fade-in Animation
Frame.BackgroundTransparency = 1
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0})
tween:Play()

-- Close Button
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -45, 0, 5)
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
    local fadeOut = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 1})
    fadeOut:Play()
    fadeOut.Completed:Wait()
    ScreenGui:Destroy()
end)

-- Hover Effect for Close Button
Close.MouseEnter:Connect(function()
    TweenService:Create(Close, tweenInfo, {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
end)
Close.MouseLeave:Connect(function()
    TweenService:Create(Close, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0.05, 0)
Title.Text = "Alex Hub V1 - Code Entry"
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Frame

-- Instructions
local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, -20, 0, 30)
Instructions.Position = UDim2.new(0, 10, 0.2, 0)
Instructions.Text = "Enter the code to unlock Alex Hub V1"
Instructions.TextSize = 16
Instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
Instructions.BackgroundTransparency = 1
Instructions.Font = Enum.Font.SourceSansPro
Instructions.TextXAlignment = Enum.TextXAlignment.Center
Instructions.Parent = Frame

-- TextBox for Code Entry
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.9, 0, 0.15, 0)
TextBox.Position = UDim2.new(0.05, 0, 0.35, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TextBox.PlaceholderText = "Enter Code (Hint: ALEXIS...)"
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
TextBoxStroke.Color = Color3.fromRGB(0, 255, 255)
TextBoxStroke.Transparency = 0.5
TextBoxStroke.Parent = TextBox

-- Submit Button
local SubmitCode = Instance.new("TextButton")
SubmitCode.Size = UDim2.new(0.9, 0, 0.15, 0)
SubmitCode.Position = UDim2.new(0.05, 0, 0.55, 0)
SubmitCode.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
SubmitCode.Text = "Submit Code"
SubmitCode.TextSize = 20
SubmitCode.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitCode.Font = Enum.Font.GothamBold
SubmitCode.Parent = Frame

local SubmitCodeCorner = Instance.new("UICorner")
SubmitCodeCorner.CornerRadius = UDim.new(0, 8)
SubmitCodeCorner.Parent = SubmitCode

-- Hover Effect for Submit Button
SubmitCode.MouseEnter:Connect(function()
    TweenService:Create(SubmitCode, tweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 150, 255)}):Play()
end)
SubmitCode.MouseLeave:Connect(function()
    TweenService:Create(SubmitCode, tweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 120, 255)}):Play()
end)

-- Validation Function
local function validateCode(code)
    return code == "ALEXISGOODATCODING"
end

-- Submit Code Logic
SubmitCode.MouseButton1Click:Connect(function()
    local enteredCode = TextBox.Text
    if validateCode(enteredCode) then
        TextBox.Text = ""
        Instructions.Text = "Code Accepted! Loading Alex Hub V1..."
        Instructions.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1.5)
        local fadeOut = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 1})
        fadeOut:Play()
        fadeOut.Completed:Wait()
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
        Instructions.Text = "Invalid code. Try again."
        Instructions.TextColor3 = Color3.fromRGB(255, 50, 50)
        TextBox.Text = ""
        wait(1.5)
        Instructions.Text = "Enter the code to unlock Alex Hub V1"
        Instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
        TextBox.PlaceholderText = "Enter Code (Hint: ALEXIS...)"
    end
end)
