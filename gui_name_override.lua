--[[ GUI Name Override - AlanbeikersFF to LORD_RAJBHAI ]]
-- This script runs after the main script and updates the GUI title

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Function to find and replace GUI title
local function updateGuiTitle()
    print("[GUI Override] Searching for AlanbeikersFF in GUI...")
    
    -- Wait a bit for the main script to create the GUI
    wait(2)
    
    -- Search through all GUI elements
    local function searchAndReplace(parent)
        for _, child in ipairs(parent:GetChildren()) do
            -- Check if it's a TextLabel or TextButton
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                if child.Text:find("AlanbeikersFF") then
                    print("[GUI Override] Found text: " .. child.Text)
                    child.Text = child.Text:gsub("AlanbeikersFF", "LORD_RAJBHAI")
                    print("[GUI Override] Updated to: " .. child.Text)
                end
            end
            
            -- Check frame properties
            if child:IsA("Frame") or child:IsA("ScrollingFrame") then
                if child:FindFirstChild("Title") then
                    local title = child.Title
                    if title:IsA("TextLabel") and title.Text:find("AlanbeikersFF") then
                        print("[GUI Override] Found title: " .. title.Text)
                        title.Text = title.Text:gsub("AlanbeikersFF", "LORD_RAJBHAI")
                        print("[GUI Override] Updated title to: " .. title.Text)
                    end
                end
            end
            
            -- Recursively search children
            searchAndReplace(child)
        end
    end
    
    -- Search the entire GUI
    searchAndReplace(playerGui)
end

-- Load main script first
print("[GUI Override] Loading main script...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/scripts-ofuzado-actualizado/refs/heads/main/unificado_v3_6_4%20(2).lua"))()

-- Then update the GUI title
updateGuiTitle()

print("[GUI Override] ✅ Complete! GUI name changed to LORD_RAJBHAI")
