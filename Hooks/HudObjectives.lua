if PDTHHud.Options:GetValue("HUD/ObjectivesPanel") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/ObjectivesPanel")) then
	Hooks:PostHook(HUDObjectives, "init", "PDTHHUDInit", function(self)
		local panel = self._hud_panel:child("objectives_panel")
		self._bg_box:set_alpha(0)
		if panel then
			panel:child("icon_objectivebox"):hide()
			panel:child("objective_text"):configure({
				font = tweak_data.hud.small_font,
				font_size = tweak_data.hud.small_font_size,
				color = Color(1, 1, 1, 1)
			})
			panel:child("amount_text"):configure({
				font_size = 18,
				font = tweak_data.hud.medium_font_noshadow,
				y = 20,
				color = Color(1, 1, 1, 1)
			})
		end
	end)
end