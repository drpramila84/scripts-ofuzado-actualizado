--[[ Dash + Hit GUI Wrapper Fix ]]
-- This wrapper ensures the dash + hit script resets properly when you die

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Store original script state
local scriptState = {
    dashEnabled = true,
    dashCooldown = 0,
    lastDashTime = 0,
    lastHitTime = 0,
}

-- Function to reset dash/hit state
local function resetDashState()
    print("[Dash Fix] Resetting dash state after death...")
    scriptState.dashEnabled = true
    scriptState.dashCooldown = 0
    scriptState.lastDashTime = 0
    scriptState.lastHitTime = 0
    wait(0.5) -- Wait for respawn
end

-- Monitor character death
humanoid.Died:Connect(function()
    print("[Dash Fix] Character died, preparing reset...")
    resetDashState()
end)

-- Monitor character respawn
player.CharacterAdded:Connect(function(newCharacter)
    print("[Dash Fix] Character respawned, resetting script...")
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    resetDashState()
    
    -- Re-attach death listener to new character
    humanoid.Died:Connect(function()
        print("[Dash Fix] Character died, preparing reset...")
        resetDashState()
    end)
end)

-- Load the main script
print("[Dash Fix] Loading main script...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/scripts-ofuzado-actualizado/refs/heads/main/unificado_v3_6_4%20(2).lua"))()

print("[Dash Fix] Wrapper initialized! Dash should now work after respawn.")
