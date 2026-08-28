if PDTHHud.Options:GetValue("HUD/MainHud") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/Teammate")) then
    function HUDManager:set_mugshot_talk(id, active)
        if not id or not managers.hud._teammate_panels[id] then
            return
        end
        managers.hud._teammate_panels[id]._panel:child("talk"):set_visible(active)
        managers.hud._teammate_panels[id]._panel:child("talk"):set_color(Color.white)
    end

    function HUDManager:set_mugshot_voice(id, active)
        if not id or not managers.hud._teammate_panels[id] then
            return
        end
        managers.hud._teammate_panels[id]._panel:child("talk"):set_visible(active)
        managers.hud._teammate_panels[id]._panel:child("talk"):set_color(Color.yellow)
    end

	function HUDManager:pd_start_progress(current, total, msg, icon_id)
		local hud = self:script(PlayerBase.PLAYER_DOWNED_HUD)

		if not hud then
			return
		end

		self._pd2_hud_interaction = HUDInteraction:new(managers.hud:script(PlayerBase.PLAYER_DOWNED_HUD))
	-- here icon_id
		self._pd2_hud_interaction:show_interact({text = utf8.to_upper(managers.localization:text(msg)), icon = icon_id})
		self._pd2_hud_interaction:show_interaction_bar(current, total)
		self._hud_player_downed:hide_timer()

		local function feed_circle(o, total)
			local t = 0

			while t < total do
				t = t + coroutine.yield()

				self._pd2_hud_interaction:set_interaction_bar_width(t, total)
			end
		end

		if _G.IS_VR then
			return
		end

		self._pd2_hud_interaction._interact_circle._circle:stop()
		self._pd2_hud_interaction._interact_circle._circle:animate(feed_circle, total)
	end

    Hooks:PostHook(HUDManager, "add_waypoint", "PDTHHudset_mugshot_talk", function(self, id, data)

        local waypoint = self._hud.waypoints[id]
        if waypoint and waypoint.distance and waypoint.arrow then
            waypoint.distance:set_color(Color(1, 1, 0.65882355, 0))
			waypoint.arrow:set_color(Color.white)
        end
    end)
end
