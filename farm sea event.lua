-- 💀 Hitman Blox Fruits Hub - Rayfield Interface
local Rayfield = nil

-- Load Rayfield library
local function loadRayfield()
    local success, result = pcall(function()
        return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)
    
    if success then
        return result
    else
        -- Try alternative source if main fails
        success, result = pcall(function()
            return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
        end)
        
        if success then
            return result
        else
            warn("Failed to load Rayfield: " .. tostring(result))
            return nil
        end
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

-- helper: safe teleport
local function safeTeleport(cf)
    local lp = game.Players.LocalPlayer
    if not lp or not lp.Character then return end
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = cf
end

-- Main initialization
local function initialize()
    -- Load Rayfield
    Rayfield = loadRayfield()
    if not Rayfield then
        warn("Critical: Failed to load Rayfield UI Library")
        return
    end
    
    -- Create window
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
    
    -- Create all 13 tabs
    local FarmTab = Window:CreateTab("🌾 Farm", "sprout")
    local SeaEventsTab = Window:CreateTab("🌊 Sea Events", "anchor")
    local IslandEventsTab = Window:CreateTab("🏝️ Island Events", "map-pin")
    local TeleportTab = Window:CreateTab("🔮 Teleport", "map")
    local PvPTab = Window:CreateTab("⚔️ PvP", "sword")
    local VisualsTab = Window:CreateTab("👁️ Visuals", "eye")
    local MiscTab = Window:CreateTab("🔧 Misc", "settings")
    local QuestTab = Window:CreateTab("📋 Quest & Items", "clipboard-list")
    local FruitTab = Window:CreateTab("🍎 Fruit & Raids", "apple")
    local StatusTab = Window:CreateTab("📊 Status", "bar-chart")
    local ShopTab = Window:CreateTab("🛒 Shop", "shopping-cart")
    local AboutTab = Window:CreateTab("ℹ️ About", "info")
    local SettingsTab = Window:CreateTab("⚙️ Settings", "settings")
    
    ----------------------------------------------------------------
    -- 🌾 Farm Tab Content  (YOUR ORIGINAL CONTENT – unchanged)
    ----------------------------------------------------------------
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

    local AutoFarmChestToggle = FarmTab:CreateToggle({
        Name = "Auto Farm Chest",
        CurrentValue = false,
        Flag = "AutoFarmChestToggle",
        Callback = function(Value)
            print("Auto Farm Chest:", Value)
        end,
    })

    local AutoFarmMasterySection = FarmTab:CreateSection("Auto Farm Mastery")
    
    local AutoFarmMasteryToggle = FarmTab:CreateToggle({
        Name = "Auto Farm Mastery",
        CurrentValue = false,
        Flag = "AutoFarmMasteryToggle",
        Callback = function(Value)
            print("Auto Farm Mastery:", Value)
        end,
    })
    
    local FarmMasteryDropdown = FarmTab:CreateDropdown({
        Name = "Farm Mastery",
        Options = {"Gun", "Blox Fruit"},
        CurrentOption = "Gun",
        Flag = "FarmMasteryDropdown",
        Callback = function(Option)
            print("Selected mastery type:", Option)
        end,
    })
    
    FarmTab:CreateSection("Choose Skills")
    local farmSkills = {"Z", "X", "C", "V", "F"}
    local selectedFarmSkills = {}
    for _, skill in ipairs(farmSkills) do
        FarmTab:CreateToggle({
            Name = skill,
            CurrentValue = false,
            Flag = "FarmSkill" .. skill .. "Toggle",
            Callback = function(Value)
                if Value then
                    table.insert(selectedFarmSkills, skill)
                else
                    for i, v in ipairs(selectedFarmSkills) do
                        if v == skill then
                            table.remove(selectedFarmSkills, i)
                            break
                        end
                    end
                end
                print("Selected farm skills:", table.concat(selectedFarmSkills, ", "))
            end,
        })
    end
    
    local ChooseHealthSlider = FarmTab:CreateSlider({
        Name = "Choose Health",
        Range = {1, 100},
        Increment = 1,
        Suffix = "%",
        CurrentValue = 50,
        Flag = "ChooseHealthSlider",
        Callback = function(Value)
            print("Health threshold set to:", Value .. "%")
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

    ----------------------------------------------------------------
    -- 🌊 Sea Events Tab Content (YOUR ORIGINAL CONTENT – unchanged)
    ----------------------------------------------------------------
    local SeaBeastSection = SeaEventsTab:CreateSection("Sea Beasts")

    local SeaLevelDropdown = SeaEventsTab:CreateDropdown({
        Name = "Sea Level",
        Options = {"1", "2", "3", "4", "5", "6", "Inf"},
        CurrentOption = "1",
        Flag = "SeaLevelDropdown",
        Callback = function(Option)
            print("Selected Sea Level:", Option)
        end,
    })

    local AutoFarmSeaToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Farm Sea",
        CurrentValue = false,
        Flag = "AutoFarmSeaToggle",
        Callback = function(Value)
            print("Auto Farm Sea:", Value)
        end,
    })

    local AutoDriveBoatToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Drive Boat",
        CurrentValue = false,
        Flag = "AutoDriveBoatToggle",
        Callback = function(Value)
            print("Auto Drive Boat:", Value)
        end,
    })

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

    local Farm2ndSeaSection = SeaEventsTab:CreateSection("Farm 2nd Sea")

    local AutoFarmSeaBeastToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Farm Sea Beast",
        CurrentValue = false,
        Flag = "AutoFarmSeaBeastToggle",
        Callback = function(Value)
            print("Auto Farm Sea Beast:", Value)
        end,
    })

    SeaEventsTab:CreateSection("Select Fish")
    local fishOptions = {"Sea Beast", "Terror Shark", "Pirana", "Fish Crew", "Shark"}
    local selectedFish = {}
    for _, fish in ipairs(fishOptions) do
        SeaEventsTab:CreateToggle({
            Name = fish,
            CurrentValue = false,
            Flag = "Fish" .. fish .. "Toggle",
            Callback = function(Value)
                if Value then
                    table.insert(selectedFish, fish)
                else
                    for i, v in ipairs(selectedFish) do
                        if v == fish then
                            table.remove(selectedFish, i)
                            break
                        end
                    end
                end
                print("Selected fish:", table.concat(selectedFish, ", "))
            end,
        })
    end

    local Farm3rdSeaSection = SeaEventsTab:CreateSection("Farm 3rd Sea")

    SeaEventsTab:CreateSection("Select Ship")
    local shipOptions = {"Pirate Ship", "Marine Ship", "Haunted Ship Raid", "Ghost Ship Raid", "Ship Raid (general)"}
    local selectedShips = {}
    for _, ship in ipairs(shipOptions) do
        SeaEventsTab:CreateToggle({
            Name = ship,
            CurrentValue = false,
            Flag = "Ship" .. ship .. "Toggle",
            Callback = function(Value)
                if Value then
                    table.insert(selectedShips, ship)
                else
                    for i, v in ipairs(selectedShips) do
                        if v == ship then
                            table.remove(selectedShips, i)
                            break
                        end
                    end
                end
                print("Selected ships:", table.concat(selectedShips, ", "))
            end,
        })
    end

    SeaEventsTab:CreateSection("Choose Skills")
    local seaSkills = {"Z", "X", "C", "V", "F"}
    local selectedSeaSkills = {}
    for _, skill in ipairs(seaSkills) do
        SeaEventsTab:CreateToggle({
            Name = skill,
            CurrentValue = false,
            Flag = "SeaSkill" .. skill .. "Toggle",
            Callback = function(Value)
                if Value then
                    table.insert(selectedSeaSkills, skill)
                else
                    for i, v in ipairs(selectedSeaSkills) do
                        if v == skill then
                            table.remove(selectedSeaSkills, i)
                            break
                        end
                    end
                end
                print("Selected sea skills:", table.concat(selectedSeaSkills, ", "))
            end,
        })
    end

    local AutoFarmShipRaidToggle = SeaEventsTab:CreateToggle({
        Name = "Auto Farm Ship Raid",
        CurrentValue = false,
        Flag = "AutoFarmShipRaidToggle",
        Callback = function(Value)
            print("Auto Farm Ship Raid:", Value)
        end,
    })

    local AdditionalFeaturesSection = SeaEventsTab:CreateSection("Additional Features")

    local RemoveFogToggle = SeaEventsTab:CreateToggle({
        Name = "Remove Fog",
        CurrentValue = false,
        Flag = "RemoveFogToggle",
        Callback = function(Value)
            print("Remove Fog:", Value)
        end,
    })

    local WalkOnWaterToggle = SeaEventsTab:CreateToggle({
        Name = "Walk on Water",
        CurrentValue = false,
        Flag = "WalkOnWaterToggle",
        Callback = function(Value)
            print("Walk on Water:", Value)
        end,
    })

    ----------------------------------------------------------------
    -- 🏝️ Island Events Tab (YOUR ORIGINAL CONTENT – unchanged)
    ----------------------------------------------------------------
    local MirageSection = IslandEventsTab:CreateSection("Mirage")
    
    local AutoMirageToggle = IslandEventsTab:CreateToggle({
        Name = "Auto Mirage",
        CurrentValue = false,
        Flag = "AutoMirageToggle",
        Callback = function(Value)
            print("Auto Mirage:", Value)
        end,
    })
    
    local AutoCollectMirageChestToggle = IslandEventsTab:CreateToggle({
        Name = "Auto Collect Mirage Chest",
        CurrentValue = false,
        Flag = "AutoCollectMirageChestToggle",
        Callback = function(Value)
            print("Auto Collect Mirage Chest:", Value)
        end,
    })
    
    local TeleportToMirageToggle = IslandEventsTab:CreateToggle({
        Name = "Teleport to Mirage",
        CurrentValue = false,
        Flag = "TeleportToMirageToggle",
        Callback = function(Value)
            print("Teleport to Mirage:", Value)
        end,
    })
    
    local TeleportToMirageFruitGatchaToggle = IslandEventsTab:CreateToggle({
        Name = "Teleport to Mirage Fruit Gatcha",
        CurrentValue = false,
        Flag = "TeleportToMirageFruitGatchaToggle",
        Callback = function(Value)
            print("Teleport to Mirage Fruit Gatcha:", Value)
        end,
    })
    
    local CollectBlueGearToggle = IslandEventsTab:CreateToggle({
        Name = "Collect Blue Gear",
        CurrentValue = false,
        Flag = "CollectBlueGearToggle",
        Callback = function(Value)
            print("Collect Blue Gear:", Value)
        end,
    })
    
    local LookAtMoonToggle = IslandEventsTab:CreateToggle({
        Name = "Look at Moon",
        CurrentValue = false,
        Flag = "LookAtMoonToggle",
        Callback = function(Value)
            print("Look at Moon:", Value)
        end,
    })

    local PrehistoricIslandSection = IslandEventsTab:CreateSection("Prehistoric Island")
    
    local TeleportToPrehistoricToggle = IslandEventsTab:CreateToggle({
        Name = "Teleport to Prehistoric Island",
        CurrentValue = false,
        Flag = "TeleportToPrehistoricToggle",
        Callback = function(Value)
            print("Teleport to Prehistoric Island:", Value)
        end,
    })
    
    local FullyPrehistoricIslandToggle = IslandEventsTab:CreateToggle({
        Name = "Fully Prehistoric Island",
        CurrentValue = false,
        Flag = "FullyPrehistoricIslandToggle",
        Callback = function(Value)
            print("Fully Prehistoric Island:", Value)
        end,
    })
    
    local AutoCollectEggsBonesToggle = IslandEventsTab:CreateToggle({
        Name = "Auto Collect Eggs and Bones",
        CurrentValue = false,
        Flag = "AutoCollectEggsBonesToggle",
        Callback = function(Value)
            print("Auto Collect Eggs and Bones:", Value)
        end,
    })
    
    local CraftVolcanicMagnetToggle = IslandEventsTab:CreateToggle({
        Name = "Craft Volcanic Magnet",
        CurrentValue = false,
        Flag = "CraftVolcanicMagnetToggle",
        Callback = function(Value)
            print("Craft Volcanic Magnet:", Value)
        end,
    })

    local KitsuneIslandSection = IslandEventsTab:CreateSection("Kitsune Island")
    
    local TeleportToKitsuneToggle = IslandEventsTab:CreateToggle({
        Name = "Teleport to Kitsune Island",
        CurrentValue = false,
        Flag = "TeleportToKitsuneToggle",
        Callback = function(Value)
            print("Teleport to Kitsune Island:", Value)
        end,
    })
    
    local AutoStartKitsuneToggle = IslandEventsTab:CreateToggle({
        Name = "Auto Start Kitsune Island",
        CurrentValue = false,
        Flag = "AutoStartKitsuneToggle",
        Callback = function(Value)
            print("Auto Start Kitsune Island:", Value)
        end,
    })
    
    local FullyKitsuneIslandToggle = IslandEventsTab:CreateToggle({
        Name = "Fully Kitsune Island",
        CurrentValue = false,
        Flag = "FullyKitsuneIslandToggle",
        Callback = function(Value)
            print("Fully Kitsune Island:", Value)
        end,
    })
    
    local AutoTradeAmberToggle = IslandEventsTab:CreateToggle({
        Name = "Auto Trade Amber",
        CurrentValue = false,
        Flag = "AutoTradeAmberToggle",
        Callback = function(Value)
            print("Auto Trade Amber:", Value)
        end,
    })
    
    local AmberAmountSlider = IslandEventsTab:CreateSlider({
        Name = "Amber Amount",
        Range = {1, 30},
        Increment = 1,
        Suffix = "Amber",
        CurrentValue = 5,
        Flag = "AmberAmountSlider",
        Callback = function(Value)
            print("Amber Amount set to:", Value)
        end,
    })
    
    local AutoCollectAmberToggle = IslandEventsTab:CreateToggle({
        Name = "Auto Collect Amber",
        CurrentValue = false,
        Flag = "AutoCollectAmberToggle",
        Callback = function(Value)
            print("Auto Collect Amber:", Value)
        end,
    })

    ----------------------------------------------------------------
    -- 🔮 Teleport Tab (REWORKED: three separate sea blocks)
    ----------------------------------------------------------------
    local TeleportSection1 = TeleportTab:CreateSection("1st Sea Teleport")

    local Sea1Islands = {
        "Pirate Starter Island","Marine Starter Island","Jungle","Pirate Village",
        "Desert","Middle Town","Frozen Village","Marine Fortress","Skylands",
        "Lower Skylands","Upper Skylands","Prison","Colosseum","Magma Village",
        "Underwater City","Fountain City"
    }
    local SelectedSea1Island = Sea1Islands[1]

    local Sea1Dropdown = TeleportTab:CreateDropdown({
        Name = "Select Island (1st Sea)",
        Options = Sea1Islands,
        CurrentOption = Sea1Islands[1],
        Flag = "TP_Sea1_Dropdown",
        Callback = function(opt) SelectedSea1Island = opt end,
    })

    TeleportTab:CreateToggle({
        Name = "Teleport to Selected Island (1st Sea)",
        CurrentValue = false,
        Flag = "TP_Sea1_Toggle",
        Callback = function(v)
            if not v then return end
            print("Teleporting to 1st Sea -> "..tostring(SelectedSea1Island))
            -- TODO: replace with real coords per island
            safeTeleport(CFrame.new(0, 15, 0))
        end
    })

    local TeleportSection2 = TeleportTab:CreateSection("2nd Sea Teleport")

    local Sea2Islands = {
        "Kingdom of Rose","Remote Island","Cafe","Don Swan’s Mansion","Green Zone",
        "Graveyard","Snow Mountain","Dark Arena","Hot and Cold","Cursed Ship",
        "Ice Castle","Forgotten Island"
    }
    local SelectedSea2Island = Sea2Islands[1]

    local Sea2Dropdown = TeleportTab:CreateDropdown({
        Name = "Select Island (2nd Sea)",
        Options = Sea2Islands,
        CurrentOption = Sea2Islands[1],
        Flag = "TP_Sea2_Dropdown",
        Callback = function(opt) SelectedSea2Island = opt end,
    })

    TeleportTab:CreateToggle({
        Name = "Teleport to Selected Island (2nd Sea)",
        CurrentValue = false,
        Flag = "TP_Sea2_Toggle",
        Callback = function(v)
            if not v then return end
            print("Teleporting to 2nd Sea -> "..tostring(SelectedSea2Island))
            -- TODO: replace with real coords per island
            safeTeleport(CFrame.new(2500, 15, 2500))
        end
    })

    local TeleportSection3 = TeleportTab:CreateSection("3rd Sea Teleport")

    local Sea3Islands = {
        "Mansion","Castle on the Sea","Hydra Island","Haunted Castle","Tiki Outpost",
        "Great Tree","Floating Turtle","Sea of Treats","Port Town"
    }
    local SelectedSea3Island = Sea3Islands[1]

    local Sea3Dropdown = TeleportTab:CreateDropdown({
        Name = "Select Island (3rd Sea)",
        Options = Sea3Islands,
        CurrentOption = Sea3Islands[1],
        Flag = "TP_Sea3_Dropdown",
        Callback = function(opt) SelectedSea3Island = opt end,
    })

    TeleportTab:CreateToggle({
        Name = "Teleport to Selected Island (3rd Sea)",
        CurrentValue = false,
        Flag = "TP_Sea3_Toggle",
        Callback = function(v)
            if not v then return end
            print("Teleporting to 3rd Sea -> "..tostring(SelectedSea3Island))
            -- TODO: replace with real coords per island
            safeTeleport(CFrame.new(5000, 15, 5000))
        end
    })

 TeleportTab:CreateButton({
    Name = "Teleport to Temple of Time",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 100, 3000) -- replace with real coords
        end
    end
})

TeleportTab:CreateButton({
    Name = "Teleport to Top of Great Tree",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(6000, 800, 6000) -- replace with real coords
        end
    end
})


----------------------------------------------------------------
-- ⚔️ PvP Tab Content
----------------------------------------------------------------

-- Combat Section
local CombatSection = PvPTab:CreateSection("Combat")

PvPTab:CreateToggle({
    Name = "Auto Shoot",
    CurrentValue = false,
    Flag = "AutoShoot",
    Callback = function(Value)
        print("Auto Shoot:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "Auto Attack",
    CurrentValue = false,
    Flag = "AutoAttack",
    Callback = function(Value)
        print("Auto Attack:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "Aim Bot",
    CurrentValue = false,
    Flag = "AimBot",
    Callback = function(Value)
        print("Aim Bot:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "Aim Bot Skills",
    CurrentValue = false,
    Flag = "AimBotSkills",
    Callback = function(Value)
        print("Aim Bot Skills:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "Ignores Mobs",
    CurrentValue = false,
    Flag = "IgnoreMobs",
    Callback = function(Value)
        print("Ignore Mobs:", Value)
    end
})


-- Player Settings Section
local PlayerSettingsSection = PvPTab:CreateSection("Player Settings")

PvPTab:CreateSlider({
    Name = "Player Speed",
    Range = {20, 200},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 20,
    Flag = "PlayerSpeed",
    Callback = function(Value)
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
        end
    end
})

PvPTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 5000},
    Increment = 10,
    Suffix = " Power",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
        end
    end
})

PvPTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        print("Infinite Jump:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "No Clip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        print("No Clip:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "No Stun",
    CurrentValue = false,
    Flag = "NoStun",
    Callback = function(Value)
        print("No Stun:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "Camera Lock",
    CurrentValue = false,
    Flag = "CameraLock",
    Callback = function(Value)
        print("Camera Lock:", Value)
    end
})


-- Race Section
local RaceSection = PvPTab:CreateSection("Race")

PvPTab:CreateToggle({
    Name = "Auto on Race V3",
    CurrentValue = false,
    Flag = "AutoRaceV3",
    Callback = function(Value)
        print("Auto Race V3:", Value)
    end
})

PvPTab:CreateToggle({
    Name = "Auto on Race V4",
    CurrentValue = false,
    Flag = "AutoRaceV4",
    Callback = function(Value)
        print("Auto Race V4:", Value)
    end
})


----------------------------------------------------------------
-- 👁️ Visuals Tab Content (ESP Section)
----------------------------------------------------------------

local EspSection = VisualsTab:CreateSection("ESP")

VisualsTab:CreateToggle({
    Name = "ESP Player",
    CurrentValue = false,
    Flag = "EspPlayer",
    Callback = function(Value)
        print("ESP Player:", Value)
    end
})

VisualsTab:CreateToggle({
    Name = "ESP Fruit",
    CurrentValue = false,
    Flag = "EspFruit",
    Callback = function(Value)
        print("ESP Fruit:", Value)
    end
})

VisualsTab:CreateToggle({
    Name = "ESP Chest",
    CurrentValue = false,
    Flag = "EspChest",
    Callback = function(Value)
        print("ESP Chest:", Value)
    end
})

VisualsTab:CreateToggle({
    Name = "ESP Boat",
    CurrentValue = false,
    Flag = "EspBoat",
    Callback = function(Value)
        print("ESP Boat:", Value)
    end
})

VisualsTab:CreateToggle({
    Name = "ESP Island",
    CurrentValue = false,
    Flag = "EspIsland",
    Callback = function(Value)
        print("ESP Island:", Value)
    end
})

VisualsTab:CreateSlider({
    Name = "ESP Name Size",
    Range = {6, 20},
    Increment = 1,
    Suffix = " Size",
    CurrentValue = 12,
    Flag = "EspNameSize",
    Callback = function(Value)
        print("ESP Name Size:", Value)
    end
})

VisualsTab:CreateLabel("More Coming Soon")


    ----------------------------------------------------------------
    -- Placeholders for the rest of your tabs (unchanged)
    ----------------------------------------------------------------


    MiscTab:CreateSection("Movement")
    MiscTab:CreateSection("Utility")
    MiscTab:CreateSection("Character")
    MiscTab:CreateSection("Game Features")

    QuestTab:CreateSection("Quests")
    QuestTab:CreateSection("Items")
    QuestTab:CreateSection("Inventory")
    QuestTab:CreateSection("Trading")

    FruitTab:CreateSection("Fruits")
    FruitTab:CreateSection("Raids")
    FruitTab:CreateSection("Fruit Stats")
    FruitTab:CreateSection("Awakening")

    StatusTab:CreateSection("Player Stats")
    StatusTab:CreateSection("Game Stats")
    StatusTab:CreateSection("Server Info")
    StatusTab:CreateSection("Performance")

    ShopTab:CreateSection("Items")
    ShopTab:CreateSection("Fruits")
    ShopTab:CreateSection("Weapons")
    ShopTab:CreateSection("Accessories")

    AboutTab:CreateSection("Information")
    AboutTab:CreateSection("Credits")
    AboutTab:CreateSection("Updates")
    AboutTab:CreateSection("Support")

    SettingsTab:CreateSection("Configuration")
    SettingsTab:CreateSection("Themes")
    SettingsTab:CreateSection("Keybinds")
    SettingsTab:CreateSection("UI Settings")

    -- Success message
    if Rayfield.Notify then
        Rayfield:Notify({
            Title = "✅ Hitman Hub Loaded",
            Content = "All tabs (including new Teleport) loaded!",
            Duration = 6,
            Image = 4483362458,
        })
    end

    print("✅ Hitman Blox Fruits Hub with Teleport tab reworked successfully!")
end

-- Start the script
initialize()
