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
-- 🔮 Teleport Tab (Sea Teleports)
----------------------------------------------------------------
local SeaTeleportSection = TeleportTab:CreateSection("Sea Teleports")

TeleportTab:CreateButton({
    Name = "Teleport to 1st Sea",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer
        TeleportService:Teleport(2753915549, player) -- 1st Sea
    end
})

TeleportTab:CreateButton({
    Name = "Teleport to 2nd Sea",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer
        TeleportService:Teleport(4442272183, player) -- 2nd Sea
    end
})

TeleportTab:CreateButton({
    Name = "Teleport to 3rd Sea",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer
        TeleportService:Teleport(7449423635, player) -- 3rd Sea
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
-- 🔧 Misc Tab Content — Server Utilities + Debug/Fun (WORKING)
-- paste this anywhere AFTER `local MiscTab = Window:CreateTab(...)`
----------------------------------------------------------------

-- ⛓️ Server / Game Utilities
MiscTab:CreateSection("Server / Game Utilities")

MiscTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        local ts = game:GetService("TeleportService")
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

MiscTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        task.spawn(function()
            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"

            local ok, body = pcall(game.HttpGet, game, url)
            if not ok then
                TeleportService:Teleport(game.PlaceId)
                return
            end

            local success, decoded = pcall(HttpService.JSONDecode, HttpService, body)
            local pool = {}
            if success and decoded and decoded.data then
                for _, srv in ipairs(decoded.data) do
                    if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                        table.insert(pool, srv.id)
                    end
                end
            end

            if #pool > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, pool[math.random(#pool)], game.Players.LocalPlayer)
            else
                TeleportService:Teleport(game.PlaceId)
            end
        end)
    end
})

-- ⚙️ Debug / Fun Stuff
MiscTab:CreateSection("Debug / Fun Stuff")

MiscTab:CreateButton({
    Name = "FPS Booster",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture")
                or obj:IsA("Trail") or obj:IsA("Beam")
                or obj:IsA("ParticleEmitter") or obj:IsA("Smoke")
                or obj:IsA("Fire") then
                obj:Destroy()
            end
        end
    end
})

MiscTab:CreateSlider({
    Name = "Custom FOV",
    Range = {50, 120},
    Increment = 1,
    CurrentValue = (workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70,
    Flag = "Hitman_CustomFOV",
    Callback = function(v)
        if workspace.CurrentCamera then
            workspace.CurrentCamera.FieldOfView = v
        end
    end
})

MiscTab:CreateButton({
    Name = "Remove Laggy Effects",
    Callback = function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
                or obj:IsA("Smoke") or obj:IsA("Fire") then
                obj:Destroy()
            end
        end
    end
})

do
    local AntiAFKConn
    MiscTab:CreateToggle({
        Name = "Anti AFK",
        CurrentValue = false,
        Flag = "Hitman_AntiAFK",
        Callback = function(on)
            if on and not AntiAFKConn then
                local vu = game:GetService("VirtualUser")
                AntiAFKConn = game.Players.LocalPlayer.Idled:Connect(function()
                    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            elseif not on and AntiAFKConn then
                AntiAFKConn:Disconnect()
                AntiAFKConn = nil
            end
        end
    })
end

MiscTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Health = 0
        elseif lp.Character then
            lp.Character:BreakJoints()
        end
    end
})


----------------------------------------------------------------
-- 📋 Quest & Items Tab Content (extended)
----------------------------------------------------------------

-- 🌊 Auto Farms
QuestTab:CreateToggle({
    Name = "Auto Farm Factory (2nd Sea)",
    CurrentValue = false,
    Flag = "AutoFarmFactory2ndSea",
    Callback = function(Value)
        print("Auto Farm Factory:", Value)
    end
})

QuestTab:CreateToggle({
    Name = "Auto Farm Pirate Raid (3rd Sea)",
    CurrentValue = false,
    Flag = "AutoFarmPirateRaid3rdSea",
    Callback = function(Value)
        print("Auto Farm Pirate Raid:", Value)
    end
})

QuestTab:CreateToggle({
    Name = "Auto Farm Elite Hunter Quest",
    CurrentValue = false,
    Flag = "AutoFarmEliteHunter",
    Callback = function(Value)
        print("Auto Farm Elite Hunter Quest:", Value)
    end
})

-- ⚔️ 3rd Sea Quests Section
local ThirdSeaQuestSection = QuestTab:CreateSection("3rd Sea Quests")

QuestTab:CreateToggle({
    Name = "Auto Farm Dough King",
    CurrentValue = false,
    Flag = "AutoFarmDoughKing",
    Callback = function(Value) print("Auto Dough King:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Farm Cake Prince",
    CurrentValue = false,
    Flag = "AutoFarmCakePrince",
    Callback = function(Value) print("Auto Cake Prince:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Farm Rip Indra",
    CurrentValue = false,
    Flag = "AutoFarmRipIndra",
    Callback = function(Value) print("Auto Rip Indra:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Rainbow Haki",
    CurrentValue = false,
    Flag = "AutoRainbowHaki",
    Callback = function(Value) print("Auto Rainbow Haki:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Citizen Quest",
    CurrentValue = false,
    Flag = "AutoCitizenQuest",
    Callback = function(Value) print("Auto Citizen Quest:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Tyrant of the Skies Quest",
    CurrentValue = false,
    Flag = "AutoTyrantQuest",
    Callback = function(Value) print("Auto Tyrant Quest:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Kill Soul Reaper",
    CurrentValue = false,
    Flag = "AutoKillSoulReaper",
    Callback = function(Value) print("Auto Kill Soul Reaper:", Value) end
})

-- 🗡️ 3rd Sea Items Section
local ThirdSeaItemsSection = QuestTab:CreateSection("3rd Sea Items")

QuestTab:CreateToggle({
    Name = "Auto Collect Yama Sword (after 30 Elite Hunter kills)",
    CurrentValue = false,
    Flag = "AutoYamaSword",
    Callback = function(Value) print("Auto Yama Sword:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Complete Tushita Quest",
    CurrentValue = false,
    Flag = "AutoTushitaQuest",
    Callback = function(Value) print("Auto Tushita Quest:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto CDK Quest",
    CurrentValue = false,
    Flag = "AutoCDKQuest",
    Callback = function(Value) print("Auto CDK Quest:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Rainbow Haki",
    CurrentValue = false,
    Flag = "AutoRainbowHakiItem",
    Callback = function(Value) print("Auto Rainbow Haki (Item):", Value) end
})

-- ⚔️ 2nd Sea Quests Section
local SecondSeaQuestSection = QuestTab:CreateSection("2nd Sea Quests")

QuestTab:CreateToggle({
    Name = "Auto Kill Don Swan",
    CurrentValue = false,
    Flag = "AutoKillDonSwan",
    Callback = function(Value) print("Auto Kill Don Swan:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Kill Darkbeard",
    CurrentValue = false,
    Flag = "AutoKillDarkbeard",
    Callback = function(Value) print("Auto Kill Darkbeard:", Value) end
})

QuestTab:CreateToggle({
    Name = "Auto Kill Cursed Captain",
    CurrentValue = false,
    Flag = "AutoKillCursedCaptain",
    Callback = function(Value) print("Auto Kill Cursed Captain:", Value) end
})

-- ⚔️ 1st Sea Quests Section
local FirstSeaQuestSection = QuestTab:CreateSection("1st Sea Quests")

QuestTab:CreateToggle({
    Name = "Auto Saber Quest",
    CurrentValue = false,
    Flag = "AutoSaberQuest",
    Callback = function(Value) print("Auto Saber Quest:", Value) end
})

-- Note / Footer
QuestTab:CreateLabel("Lemme know if u guys want any other quest")


----------------------------------------------------------------
-- 🍎 Fruit & Raids Tab Content
----------------------------------------------------------------

-- 🍏 Fruit Section
local FruitSection = FruitTab:CreateSection("Fruit")

FruitTab:CreateToggle({
    Name = "Teleport to Fruit",
    CurrentValue = false,
    Flag = "TeleportToFruit",
    Callback = function(Value)
        print("Teleport to Fruit:", Value)
    end
})

FruitTab:CreateToggle({
    Name = "Auto Store Fruit",
    CurrentValue = false,
    Flag = "AutoStoreFruit",
    Callback = function(Value)
        print("Auto Store Fruit:", Value)
    end
})

FruitTab:CreateToggle({
    Name = "Auto Random Fruit",
    CurrentValue = false,
    Flag = "AutoRandomFruit",
    Callback = function(Value)
        print("Auto Random Fruit:", Value)
    end
})

-- ⚔️ Raids Section
local RaidSection = FruitTab:CreateSection("Raids")

FruitTab:CreateToggle({
    Name = "Auto Start Raid",
    CurrentValue = false,
    Flag = "AutoStartRaid",
    Callback = function(Value)
        print("Auto Start Raid:", Value)
    end
})

FruitTab:CreateToggle({
    Name = "Auto Complete Raid",
    CurrentValue = false,
    Flag = "AutoCompleteRaid",
    Callback = function(Value)
        print("Auto Complete Raid:", Value)
    end
})

FruitTab:CreateToggle({
    Name = "Auto Buy Raid Chip",
    CurrentValue = false,
    Flag = "AutoBuyRaidChip",
    Callback = function(Value)
        print("Auto Buy Raid Chip:", Value)
    end
})

FruitTab:CreateDropdown({
    Name = "Select Fruit for Raid Chip",
    Options = {"Flame", "Ice", "Quake", "Dark", "Light", "String", "Rumble", "Magma", "Buddha", "Sand", "Phoenix", "Dough"},
    CurrentOption = "Flame",
    Flag = "RaidChipFruitDropdown",
    Callback = function(Option)
        print("Selected Raid Chip Fruit:", Option)
    end
})

----------------------------------------------------------------
-- 🛒 Shop Tab
----------------------------------------------------------------

local ShopMainSection = ShopTab:CreateSection("Main Shop")

-- Refund Stats (2500 Fragments)
ShopTab:CreateButton({
    Name = "Refund Stats (2500 Frags)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Refund", true)
    end
})

-- Race Reroll (3000 Fragments)
ShopTab:CreateButton({
    Name = "Race Reroll (3000 Frags)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

-- Buy Ghoul Race
ShopTab:CreateButton({
    Name = "Buy Ghoul Race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyRace", "Ghoul")
    end
})

-- Buy Cyborg Race
ShopTab:CreateButton({
    Name = "Buy Cyborg Race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyRace", "Cyborg")
    end
})

-- Buy Draco Race
ShopTab:CreateButton({
    Name = "Buy Draco Race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyRace", "Draco")
    end
})

----------------------------------------------------------------
-- 🥊 Fighting Styles Section
----------------------------------------------------------------
local FightingStyleSection = ShopTab:CreateSection("Fighting Styles")

-- Fighting Style Buttons
local FightingStyles = {
    "Godhuman",
    "Sanguine Art",
    "DragonTalon",
    "ElectricClaw",
    "DeathStep",
    "Superhuman",
    "WaterKungFu",
    "Electric",
    "DragonBreath",
    "DarkStep"
}

for _, style in ipairs(FightingStyles) do
    ShopTab:CreateButton({
        Name = "Buy " .. style,
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. style)
        end
    })
end


----------------------------------------------------------------
-- 📊 Status Tab Content (Fixed)
----------------------------------------------------------------

-- 🟢 Player Stats Section
local PlayerStatsSection = StatusTab:CreateSection("Player Stats")

local LevelLabel = StatusTab:CreateLabel("Level: Loading...")
local BountyLabel = StatusTab:CreateLabel("Bounty/Honor: Loading...")
local RaceLabel = StatusTab:CreateLabel("Race & Version: Loading...")
local WeaponLabel = StatusTab:CreateLabel("Equipped Weapon: Loading...")

-- 🟢 Islands Status Section
local IslandSection = StatusTab:CreateSection("Islands Status")

local MirageLabel = StatusTab:CreateLabel("Mirage Island: Not Detected")
local KitsuneLabel = StatusTab:CreateLabel("Kitsune Island: Not Detected")
local PrehistoricLabel = StatusTab:CreateLabel("Prehistoric Island: Not Detected")

-- 🟢 Server Info Section
local ServerSection = StatusTab:CreateSection("Server Info")

local PlayersLabel = StatusTab:CreateLabel("Players in Server: Loading...")
local OptionsLabel = StatusTab:CreateLabel("Options Enabled: 0")
local DoughKingLabel = StatusTab:CreateLabel("Kills to spawn Dough King: Loading...")
local CakePrinceLabel = StatusTab:CreateLabel("Kills to spawn Cake Prince: Loading...")
local EliteHunterLabel = StatusTab:CreateLabel("Elite Hunters Killed: Loading...")
local FruitSpawnLabel = StatusTab:CreateLabel("Fruit Spawned: None")
local FullMoonLabel = StatusTab:CreateLabel("Time until Full Moon: Loading...")
local ServerAgeLabel = StatusTab:CreateLabel("Server Age: Loading...")

----------------------------------------------------------------
-- ✅ Fix: Track toggles globally
----------------------------------------------------------------
getgenv().ToggleStates = getgenv().ToggleStates or {}

-- Wrapper function for toggles
function CreateToggle(tab, args)
    local t = tab:CreateToggle({
        Name = args.Name,
        CurrentValue = args.CurrentValue or false,
        Flag = args.Flag or args.Name,
        Callback = function(Value)
            getgenv().ToggleStates[args.Flag or args.Name] = Value
            if args.Callback then
                args.Callback(Value)
            end
        end
    })
    return t
end

-- Helper to count toggles ON
local function CountToggles()
    local count = 0
    for _, v in pairs(getgenv().ToggleStates) do
        if v == true then
            count += 1
        end
    end
    return count
end

----------------------------------------------------------------
-- 🔄 Auto Updating Loop
----------------------------------------------------------------
task.spawn(function()
    while task.wait(3) do
        -- Player Info
        pcall(function()
            LevelLabel:Set("Level: " .. game.Players.LocalPlayer.Data.Level.Value)
            BountyLabel:Set("Bounty/Honor: " .. game.Players.LocalPlayer.leaderstats["Bounty/Honor"].Value)
            RaceLabel:Set("Race & Version: " .. tostring(game.Players.LocalPlayer.Data.Race.Value) .. " V" .. tostring(game.Players.LocalPlayer.Data.RaceAwakening.Value))
            WeaponLabel:Set("Equipped Weapon: " .. (game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name or "None"))
        end)

        -- Islands (placeholder logic – replace with your detection)
        MirageLabel:Set("Mirage Island: Not Spawned")
        KitsuneLabel:Set("Kitsune Island: Not Spawned")
        PrehistoricLabel:Set("Prehistoric Island: Not Spawned")

        -- Server Info
        PlayersLabel:Set("Players in Server: " .. #game.Players:GetPlayers())
        OptionsLabel:Set("Options Enabled: " .. tostring(CountToggles()))

        -- 🌊 Sea-based quest counters
        local sea = game.PlaceId
        if sea == 7449423635 then -- 3rd Sea PlaceID (replace with actual if different)
            DoughKingLabel:Set("Kills to spawn Dough King: " .. tostring(500)) -- replace with tracker
            CakePrinceLabel:Set("Kills to spawn Cake Prince: " .. tostring(500)) -- replace with tracker
            EliteHunterLabel:Set("Elite Hunters Killed: " .. tostring(0)) -- replace with tracker
        else
            DoughKingLabel:Set("Kills to spawn Dough King: (Go to 3rd Sea)")
            CakePrinceLabel:Set("Kills to spawn Cake Prince: (Go to 3rd Sea)")
            EliteHunterLabel:Set("Elite Hunters Killed: (Go to 3rd Sea)")
        end

        FruitSpawnLabel:Set("Fruit Spawned: None") -- replace with fruit detection
        FullMoonLabel:Set("Time until Full Moon: " .. tostring("1h 20m")) -- replace with real moon calc
        ServerAgeLabel:Set("Server Age: " .. string.format("%d minutes", math.floor(workspace.DistributedGameTime/60)))
    end
end)


----------------------------------------------------------------
-- ℹ️ About Tab
----------------------------------------------------------------
local AboutSection = AboutTab:CreateSection("About This Script")

AboutTab:CreateLabel("Developed by HitmanHub with expert collaboration from White Devil and Brooken 🤝")
AboutTab:CreateLabel("High-quality script built with clean, modular code and optimized performance ⚡")
AboutTab:CreateLabel("Designed for seamless integration and advanced automation workflows 🔧")
AboutTab:CreateLabel("Combines innovation, technical excellence, and reliability for powerful task execution 🚀")

AboutTab:CreateLabel("────────────────────────────")

AboutTab:CreateLabel("Join our Discord Community:")

AboutTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/ea2hRcH3Ht")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Discord",
            Text = "Permanent Discord link copied to clipboard!",
            Duration = 5
        })
    end
})

AboutTab:CreateLabel("(Stay tuned for more updates!)")



    ----------------------------------------------------------------
    -- Placeholders for the rest of your tabs (unchanged)
    ----------------------------------------------------------------



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
