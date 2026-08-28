if PDTHHud.Options:GetValue("HUD/MainHud") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/HeistTimer")) then
    local HUDHeistTimer_init = HUDHeistTimer.init
    function HUDHeistTimer:init(...)
        HUDHeistTimer_init(self, ...)
        local scale = PDTHHud.Options:GetValue("HUD/Scale")
        local heist_timer_panel = self._hud_panel:child("heist_timer_panel")
        heist_timer_panel:child("timer_text"):configure({
            font_size = 24 * scale,
            font = tweak_data.hud.small_font
        })
    end
end 