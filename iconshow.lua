-- Set the keytoclick value to "P”
getgenv().keytoclick = "P"

-- Get the VirtualInputManager service
local vim = game:GetService("VirtualInputManager")

-- Function to handle button click
local function onButtonClick()
    -- Send the key event for V directly
    vim:SendKeyEvent(true, Enum.KeyCode.P, false, game)
end

-- Function to create the GUI
local function createGUI()
    -- Create ScreenGui, Frame, and ImageButton
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 100, 0, 100)

    local ImageButton = Instance.new("ImageButton")
    ImageButton.Parent = Frame
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton.BorderSizePixel = 0
    ImageButton.Position = UDim2.new(0.579999983, 0, 0.680000007, 0)
    ImageButton.Size = UDim2.new(0, 39, 0, 39)
    ImageButton.Image = "http://www.roblox.com/asset/?id=18465207712"

    -- Connect button click event to the function
    ImageButton.MouseButton1Click:Connect(onButtonClick)

    return ScreenGui
end

-- Function to check and recreate GUI if it doesn't exist
local function checkAndRecreateGUI()
    -- Check if the GUI exists
    local existingGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
    if not existingGui then
        -- Recreate the GUI
        createGUI()
    end
end

-- Loop to continuously check for the existence of GUI
while true do
    checkAndRecreateGUI()
    wait(1)  -- Adjust the wait time as needed to reduce server load
end
