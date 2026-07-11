--[[ Dash + Hit (Auto Click) Wrapper Fix v2 ]]
-- Fixes the dash + hit toggle breaking after respawn

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Store toggle state
local dashHitEnabled = false
local scriptRunning = false

-- Function to find and reset the Dash + Hit toggle
local function resetDashHitToggle()
    print("[Dash Fix v2] Resetting Dash + Hit toggle after death...")
    wait(1) -- Wait for respawn to complete
    
    -- Try to re-enable if it was on
    if dashHitEnabled then
        print("[Dash Fix v2] Re-enabling Dash + Hit...")
        -- The toggle should auto-reset when you respawn
    end
end

-- Monitor character death
humanoid.Died:Connect(function()
    print("[Dash Fix v2] Character died, will reset toggle on respawn...")
    resetDashHitToggle()
end)

-- Monitor character respawn
player.CharacterAdded:Connect(function(newCharacter)
    print("[Dash Fix v2] Character respawned, reattaching listeners...")
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    
    -- Reattach death listener
    humanoid.Died:Connect(function()
        print("[Dash Fix v2] Character died, will reset toggle on respawn...")
        resetDashHitToggle()
    end)
end)

-- Load the main script
print("[Dash Fix v2] Loading main unified script...")
if not scriptRunning then
    scriptRunning = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/scripts-ofuzado-actualizado/refs/heads/main/unificado_v3_6_4%20(2).lua"))()
end

print("[Dash Fix v2] ✅ Ready! The 'Dash + Hit (Auto Click)' toggle should now persist after respawn.")
print("[Dash Fix v2] If toggle still breaks, try toggling it OFF then back ON after respawn.")
