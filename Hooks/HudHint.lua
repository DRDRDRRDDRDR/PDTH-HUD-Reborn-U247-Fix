if PDTHHud.Options:GetValue("HUD/Interaction") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/Interaction")) then
    local orig_hudhint_init = HUDHint.init
    function HUDHint:init(hud)
        orig_hudhint_init(self, hud)
        local const = PDTHHud.constants
        self._hud_panel = hud.panel
        local y = self._hud_panel:h() / 3.8
        self._hint_panel:set_center_y(y)
        local clip_panel = self._hint_panel:child("clip_panel")
        local scale = PDTHHud.Options:GetValue("HUD/Scale")
        clip_panel:child("hint_text"):configure({
            font_size = const.hint_font_size,
            font = tweak_data.hud.small_font
        })
    end
end