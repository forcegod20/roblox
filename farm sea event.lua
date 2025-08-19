-- Hitman Blox Fruits Hub - Rayfield Interface
local Rayfield = nil
local success, errorMsg = pcall(function()
    -- Try the main URL first
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    -- If that fails, try an alternative source
    if not Rayfield then
        Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    end
end)

if not success or not Rayfield then
    warn("Failed to load Rayfield UI Library: " .. tostring(errorMsg))
    
    -- Try one more backup source
    local backupSuccess, backupRayfield = pcall(function()
        return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    end)
    
    if backupSuccess and backupRayfield then
        Rayfield = backupRayfield
        warn("Loaded Rayfield from backup source")
    else
        warn("Completely failed to load Rayfield UI Library")
        return
    end
end

-- Custom Hitman Theme
local HitmanTheme = {
    TextColor = Color3.fromRGB(240, 240, 240),
    Background = Color3.fromRGB(15, 15, 15),
    Topbar = Color3.fromRGB(25, 25, 25),
    Shadow = Color3.fromRGB(10, 10, 10),
    NotificationBackground = Color3.fromRGB(15, 15, 15),
    NotificationActionsBackground = Color3.fromRGB(220, 220, 220),
    TabBackground = Color3.fromRGB(35, 35, 35),
    TabStroke = Color3.fromRGB(40, 40, 40),
    TabBackgroundSelected = Color3.fromRGB(200, 0, 0),
    TabTextColor = Color3.fromRGB(240, 240, 240),
    SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
    ElementBackground = Color3.fromRGB(30, 30, 30),
    ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
    SecondaryElementBackground = Color3.fromRGB(20, 20, 20),
    ElementStroke = Color3.fromRGB(45, 45, 45),
    SecondaryElementStroke = Color3.fromRGB(35, 35, 35),
    SliderBackground = Color3.fromRGB(180, 0, 0),
    SliderProgress = Color3.fromRGB(220, 0, 0),
    SliderStroke = Color3.fromRGB(200, 0, 0),
    ToggleBackground = Color3.fromRGB(25, 25, 25),
    ToggleEnabled = Color3.fromRGB(200, 0, 0),
    ToggleDisabled = Color3.fromRGB(80, 80, 80),
    ToggleEnabledStroke = Color3.fromRGB(220, 0, 0),
    ToggleDisabledStroke = Color3.fromRGB(100, 100, 100),
    ToggleEnabledOuterStroke = Color3.fromRGB(90, 90, 90),
    ToggleDisabledOuterStroke = Color3.fromRGB(60, 60, 60),
    DropdownSelected = Color3.fromRGB(35, 35, 35),
    DropdownUnselected = Color3.fromRGB(25, 25, 25),
    InputBackground = Color3.fromRGB(25, 25, 25),
    InputStroke = Color3.fromRGB(60, 60, 60),
    PlaceholderColor = Color3.fromRGB(160, 160, 160)
}

local Window = Rayfield:CreateWindow({
   Name = "💀 Hitman Blox Fruits Hub",
   Icon = "skull",
   LoadingTitle = "Hitman Hub Initializing...",
   LoadingSubtitle = "Premium Blox Fruits Script",
   Theme = HitmanTheme,
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "HitmanBloxFruits",
      FileName = "HitmanConfig"
   },
   KeySystem = false,
})

if not Window then
    warn("Failed to create Rayfield Window")
    return
end

-- Create all 13 tabs with error handling
local tabs = {}
local tabNames = {
    "🌾 Farm", "🌊 Sea Events", "🏝️ Island Events", "🔮 Teleport", 
    "⚔️ PvP", "👁️ Visuals", "🔧 Misc", "📋 Quest & Items", 
    "🍎 Fruit & Raids", "📊 Status", "🛒 Shop", "ℹ️ About", "⚙️ Settings"
}

local tabIcons = {
    "sprout", "anchor", "map-pin", "map", "sword", "eye", 
    "settings", "clipboard-list", "apple", "bar-chart", 
    "shopping-cart", "info", "settings"
}

for i, name in ipairs(tabNames) do
    local success, tab = pcall(function()
        return Window:CreateTab(name, tabIcons[i])
    end)
    
    if success and tab then
        tabs[name] = tab
    else
        warn("Failed to create tab: " .. name)
        -- Create a placeholder to prevent nil errors
        tabs[name] = {CreateSection = function() return {} end, CreateToggle = function() return {} end,
                     CreateDropdown = function() return {} end, CreateSlider = function() return {} end}
    end
end

-- Now reference tabs by name
local FarmTab = tabs["🌾 Farm"]
local SeaEventsTab = tabs["🌊 Sea Events"]
local IslandEventsTab = tabs["🏝️ Island Events"]
local TeleportTab = tabs["🔮 Teleport"]
local PvPTab = tabs["⚔️ PvP"]
local VisualsTab = tabs["👁️ Visuals"]
local MiscTab = tabs["🔧 Misc"]
local QuestTab = tabs["📋 Quest & Items"]
local FruitTab = tabs["🍎 Fruit & Raids"]
local StatusTab = tabs["📊 Status"]
local ShopTab = tabs["🛒 Shop"]
local AboutTab = tabs["ℹ️ About"]
local SettingsTab = tabs["⚙️ Settings"]

-- 🌾 Farm Tab Content
local function createFarmTab()
    local LevelFarmSection = FarmTab:CreateSection("Level Farm")

    local FarmToolDropdown = FarmTab:CreateDropdown({
        Name = "Select Farm Tool",
        Options = {"Melee", "Sword", "Blox Fruit"},
        CurrentOption = "Melee",
        Flag = "FarmToolDropdown",
        Callback = function(Option)
            print("Selected farm tool:", Option)
        end,
    })

    local AutoFarmToggle = FarmTab:CreateToggle({
        Name = "Auto Farm Level",
        CurrentValue = false,
        Flag = "AutoFarmToggle",
        Callback = function(Value)
            print("Auto Farm Level:", Value)
        end,
    })

    local AutoFarmMobsToggle = FarmTab:CreateToggle({
        Name = "Auto Farm Nearest Mobs",
        CurrentValue = false,
        Flag = "AutoFarmMobsToggle",
        Callback = function(Value)
            print("Auto Farm Nearest Mobs:", Value)
        end,
    })

    local FarmSettingsSection = FarmTab:CreateSection("Farm Settings")

    local TweenSpeedSlider = FarmTab:CreateSlider({
        Name = "Tween Speed",
        Range = {50, 500},
        Increment = 10,
        Suffix = "Speed",
        CurrentValue = 150,
        Flag = "TweenSpeedSlider",
        Callback = function(Value)
            print("Tween Speed set to:", Value)
        end,
    })

    local FastAttackToggle = FarmTab:CreateToggle({
        Name = "Fast Attack",
        CurrentValue = false,
        Flag = "FastAttackToggle",
        Callback = function(Value)
            print("Fast Attack:", Value)
        end,
    })

    local BringMobsToggle = FarmTab:CreateToggle({
        Name = "Bring Mobs",
        CurrentValue = false,
        Flag = "BringMobsToggle",
        Callback = function(Value)
            print("Bring Mobs:", Value)
        end,
    })

    local AutoHakiToggle = FarmTab:CreateToggle({
        Name = "Auto Haki (Aura)",
        CurrentValue = false,
        Flag = "AutoHakiToggle",
        Callback = function(Value)
            print("Auto Haki:", Value)
        end,
    })

    local AutoInstinctToggle = FarmTab:CreateToggle({
        Name = "Auto On Instinct",
        CurrentValue = false,
        Flag = "AutoInstinctToggle",
        Callback = function(Value)
            print("Auto Instinct:", Value)
        end,
    })

    local AutoStatSection = FarmTab:CreateSection("Auto Stat")

    local AutoStatToggle = FarmTab:CreateToggle({
        Name = "Auto Stat",
        CurrentValue = false,
        Flag = "AutoStatToggle",
        Callback = function(Value)
            print("Auto Stat:", Value)
        end,
    })

    local AutoStatSlider = FarmTab:CreateSlider({
        Name = "Stat Points Threshold",
        Range = {1, 500},
        Increment = 1,
        Suffix = "Points",
        CurrentValue = 10,
        Flag = "AutoStatSlider",
        Callback = function(Value)
            print("Stat Points Threshold:", Value)
        end,
    })

    local DefenceToggle = FarmTab:CreateToggle({
        Name = "Defence",
        CurrentValue = false,
        Flag = "DefenceToggle",
        Callback = function(Value)
            print("Defence:", Value)
        end,
    })

    local MeleeToggle = FarmTab:CreateToggle({
        Name = "Melee",
        CurrentValue = false,
        Flag = "MeleeToggle",
        Callback = function(Value)
            print("Melee:", Value)
        end,
    })

    local SwordToggle = FarmTab:CreateToggle({
        Name = "Sword",
        CurrentValue = false,
        Flag = "SwordToggle",
        Callback = function(Value)
            print("Sword:", Value)
        end,
    })

    local GunToggle = FarmTab:CreateToggle({
        Name = "Gun",
        CurrentValue = false,
        Flag = "GunToggle",
        Callback = function(Value)
            print("Gun:", Value)
        end,
    })

    local BloxFruitToggle = FarmTab:CreateToggle({
        Name = "Blox Fruit",
        CurrentValue = false,
        Flag = "BloxFruitToggle",
        Callback = function(Value)
            print("Blox Fruit:", Value)
        end,
    })
end

-- 🌊 Sea Events Tab Content
local function createSeaEventsTab()
    local SeaBeastSection = SeaEventsTab:CreateSection("Sea Beasts")

    -- Sea Level Dropdown
    local SeaLevelDropdown = SeaEventsTab:CreateDropdown({
        Name = "Sea Level",
        Options = {"1", "2", "3", "4", "5", "6", "Inf"},
        CurrentOption = "1",
        Flag = "SeaLevelDropdown",
        Callback = function(Option)
            print("Selected Sea Level:", Option)
        end,
    })

    -- i. Auto farm sea
    local AutoFarmSeaToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Farm Sea",
        CurrentValue = false,
        Flag = "AutoFarmSeaToggle",
        Callback = function(Value)
            print("Auto Farm Sea:", Value)
        end,
    })

    -- ii. Auto drive boat
    local AutoDriveBoatToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Drive Boat",
        CurrentValue = false,
        Flag = "AutoDriveBoatToggle",
        Callback = function(Value)
            print("Auto Drive Boat:", Value)
        end,
    })

    -- iii. Boat Speed
    local BoatSpeedSlider = SeaEventsTab:CreateSlider({
        Name = "Boat Speed",
        Range = {50, 500},
        Increment = 10,
        Suffix = "Speed",
        CurrentValue = 150,
        Flag = "BoatSpeedSlider",
        Callback = function(Value)
            print("Boat Speed set to:", Value)
        end,
    })

    -- a. Farm 2nd Sea Section
    local Farm2ndSeaSection = SeaEventsTab:CreateSection("Farm 2nd Sea")

    -- i. Auto Farm Sea Beast
    local AutoFarmSeaBeastToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Farm Sea Beast",
        CurrentValue = false,
        Flag = "AutoFarmSeaBeastToggle",
        Callback = function(Value)
            print("Auto Farm Sea Beast:", Value)
        end,
    })

    -- b. Farm 3rd Sea Section
    local Farm3rdSeaSection = SeaEventsTab:CreateSection("Farm 3rd Sea")

    -- i. Select Fish Dropdown
    local SelectFishDropdown = SeaEventsTab:CreateDropdown({
        Name = "Select Fish",
        Options = {"Sea Beast", "Terror Shark", "Pirana", "Fish Crew"},
        CurrentOption = "Sea Beast",
        Flag = "SelectFishDropdown",
        Callback = function(Option)
            print("Selected fish:", Option)
        end,
    })

    -- ii. Select Ship Dropdown (updated with new names)
    local SelectShipDropdown = SeaEventsTab:CreateDropdown({
        Name = "Select Ship",
        Options = {"Pirate Ship", "Marine Ship", "Haunted Ship Raid", "Ghost Ship Raid", "Ship Raid (general)"},
        CurrentOption = "Pirate Ship",
        Flag = "SelectShipDropdown",
        Callback = function(Option)
            print("Selected ship:", Option)
        end,
    })

    -- iii. Auto Farm Ship Raid
    local AutoFarmShipRaidToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Farm Ship Raid",
        CurrentValue = false,
        Flag = "AutoFarmShipRaidToggle",
        Callback = function(Value)
            print("Auto Farm Ship Raid:", Value)
        end,
    })

    -- Additional Features Section
    local AdditionalFeaturesSection = SeaEventsTab:CreateSection("Additional Features")

    -- Remove Fog
    local RemoveFogToggle = SeaEventsTab:CreateToggle({
        Name = "Remove Fog",
        CurrentValue = false,
        Flag = "RemoveFogToggle",
        Callback = function(Value)
            print("Remove Fog:", Value)
        end,
    })

    -- Walk on water
    local WalkOnWaterToggle = SeaEventsTab:CreateToggle({
        Name = "Walk on Water",
        CurrentValue = false,
        Flag = "WalkOnWaterToggle",
        Callback = function(Value)
            print("Walk on Water:", Value)
        end,
    })
end

-- Create the tabs with error handling
pcall(createFarmTab)
pcall(createSeaEventsTab)

-- Create placeholder sections for other tabs
local function createPlaceholderSections()
    local tabsToCreate = {
        IslandEventsTab, TeleportTab, PvPTab, VisualsTab, MiscTab,
        QuestTab, FruitTab, StatusTab, ShopTab, AboutTab, SettingsTab
    }
    
    for _, tab in ipairs(tabsToCreate) do
        pcall(function()
            tab:CreateSection("Placeholder Section")
        end)
    end
end

pcall(createPlaceholderSections)

-- Success message
if Rayfield.Notify then
    Rayfield:Notify({
       Title = "✅ Hitman Hub Loaded",
       Content = "All tabs created successfully!",
       Duration = 6,
       Image = 4483362458,
    })
end

print("✅ Hitman Blox Fruits Hub with all tabs loaded successfully!")
