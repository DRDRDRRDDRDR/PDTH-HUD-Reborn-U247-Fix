if PDTHHud.Options:GetValue("HUD/MainHud") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/Teammate")) then

if PDTHHud.Options:GetValue("HUD/AlphaBag") and not (restoration and restoration.Options:GetValue("HUD/Bag")) then
    Hooks:PostHook(HUDTemp, "init", "pdth_hud_alpha_pd2", function(self)
			self._bg_box:set_alpha(0)
			self._bg_box:hide()
			self._bg_box:set_size(0,0)
            local bag_panel = self._temp_panel:child("bag_panel")
			bag_panel:child("bag_text"):configure({
				visible = true,
                font = tweak_data.menu.small_font,
                font_size = PDTHHud.constants.bag_text_size,
                color = Color.white,
				layer = 2
            })
            self._temp_panel:child("throw_instruction"):configure({
                font = tweak_data.menu.small_font_noshadow,
                font_size = PDTHHud.constants.bag_text_size
			})
			local carry_bag = bag_panel:bitmap({name = "carry_bag", texture_rect = {28, 52, 201, 161}, layer = 1, h = PDTHHud.constants.bag_size_h, w = PDTHHud.constants.bag_size_w, alpha = 0.7, texture = "guis/textures/pdth_hud/icon_carrybag"})
			carry_bag:set_size(carry_bag:w() * 0.5, carry_bag:h() * 0.5)
			bag_panel:set_size(carry_bag:size())
			carry_bag:set_size(bag_panel:size())
			self._bag_panel_w, self._bag_panel_h = bag_panel:size()
    end)
    
    function HUDTemp:show_carry_bag(carry_id, value)
		local bag_panel = self._temp_panel:child("bag_panel")
		local carry_data = tweak_data.carry[carry_id]
		local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
		local bag_text = bag_panel:child("bag_text")
		bag_text:set_text(utf8.to_upper(type_text))
		bag_panel:set_x(self._temp_panel:parent():w() / 2)
		bag_panel:set_visible(true)
		bag_panel:stop()
		bag_panel:animate(callback(self, self, "_animate_show_bag_panel"))
    end

    Hooks:PostHook(HUDTemp, "hide_carry_bag", "pdth_hud_hide_alpha_pd2", function(self)
		local bag_panel = self._temp_panel:child("bag_panel")
		bag_panel:stop()
		bag_panel:set_visible(false)
		self._temp_panel:child("throw_instruction"):set_visible(false)
	end)
end
    function HUDTemp:_animate_show_bag_panel(bag_panel)
        local w, h = self._bag_panel_w, self._bag_panel_h
        local const = PDTHHud.constants

        local scx = self._temp_panel:w() / 2
        local ecx = self._temp_panel:w() - ((w / 2) + (const.main_equipment_size *  1.5) + const.main_bag_gap)

        local scy = self._temp_panel:h() / 2
        local ecy = self._temp_panel:h() - ((h / 2) + (const.main_equipment_size * const.main_equipment_y_offset_multiplier))

        local bottom = bag_panel:bottom()
        local center_y = bag_panel:center_y()
        local bag_text = self._bg_box:child("bag_text")
        local function open_done()
            bag_text:stop()
            bag_text:set_visible(true)
            bag_text:animate(callback(self, self, "_animate_show_text"))
        end
        self._bg_box:stop()
        self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_center"), nil, w, open_done)
        bag_panel:set_size(w, h)
        bag_panel:set_center_x(scx)
        bag_panel:set_center_y(scy)
        wait(1)
        local TOTAL_T = 0.5
        local t = TOTAL_T
        while t > 0 do
            local dt = coroutine.yield()
            t = t - dt
            bag_panel:set_center_x(math.lerp(scx, ecx, 1 - t / TOTAL_T))
            bag_panel:set_center_y(math.lerp(scy, ecy, 1 - t / TOTAL_T))
        end
        bag_panel:set_size(w, h)
        bag_panel:set_center_x(ecx)
        bag_panel:set_center_y(ecy)

        local throw_instruction = self._temp_panel:child("throw_instruction")
        throw_instruction:set_visible(true)
        throw_instruction:set_bottom(bag_panel:top())
        throw_instruction:set_right(bag_panel:right())
    end
end
