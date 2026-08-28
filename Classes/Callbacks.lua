PDTHHudCoreCallbacks = PDTHHudCoreCallbacks or class()

function PDTHHudCoreCallbacks:init(parent)
    self._parent = parent
end

function PDTHHudCoreCallbacks:ScaleConverter(option, value)
    return value * self._parent.Options:GetValue("HUD/Scale")
end

function PDTHHudCoreCallbacks:PortraitStyleChanged(key, value)
    self:PortraitSelectionChanged(key, value)
    if managers.menu_component._portrait_gui then
        managers.menu_component._portrait_gui:refresh()
    end
end

function PDTHHudCoreCallbacks:BulletStyleChanged(key, value)
    if managers.player and managers.hud and PDTHHud.Options:GetValue("HUD/MainHud") then
        local player = managers.player:local_player()
        if player then
            local inventory = player:inventory()
            if inventory then
                managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:refresh_ammo_icons()
            end
        end
    end
end

function PDTHHudCoreCallbacks:WeaponIconStyleChanged(key, value)
    PDTHHud.textures:apply_tweak_data_icons()
    if managers.hud and PDTHHud.Options:GetValue("HUD/MainHud") then
        for i = 1, HUDManager.PLAYER_PANEL do
            local tm = managers.hud._teammate_panels[i]
            if not tm._ai then
                tm:refresh_special_equipment()
            end
        end
    end
end

function PDTHHudCoreCallbacks:PortraitSelectionChanged(key, value)
    if managers.hud and PDTHHud.Options:GetValue("HUD/MainHud") then
        for i = 1, HUDManager.PLAYER_PANEL do
            local tm = managers.hud._teammate_panels[i]
            tm:RefreshPortraits()
        end
    end
end