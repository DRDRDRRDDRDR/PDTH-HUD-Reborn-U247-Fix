if PDTHHud.Options:GetValue("HUD/Assault") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/AssaultPanel")) then
    function HUDAssaultCorner:init(hud, full_hud, tweak_hud)
       local const = PDTHHud.constants

        self._hud_panel = hud.panel
        self._full_hud_panel = full_hud.panel
       self._assault_color = Color.red / 1.5
        self._vip_assault_color = Color(1, 1, 1, 0)
       --LightFX
       self._assault_color_fx = Color.red
       self._vip_assault_color_fx = Color(1, 1, 1, 0)
       self._fx_color =Color.red

       self._is_casing_mode = false

       local num_hostages = self._hud_panel:text({
            name = "num_hostages",
            text = managers.localization:text("pdth_hud_hostages") .. " 0",
            blend_mode = "normal",
            layer = 2,
            font_size = const.hostages_font_size,
            font = tweak_data.menu.small_font_noshadow
        })
       self:reposition_hostages()
       if tweak_hud.no_hostages then
            num_hostages:hide()
        end
        local assault_panel = self._hud_panel:panel({
            visible = false,
            name = "assault_panel",
            w = const.assault_w,
            h = const.assault_h,
            layer = 4
        })
        assault_panel:set_bottom(num_hostages:top())
        assault_panel:set_center_x(self._hud_panel:center_x())

        local icon_assaultbox = assault_panel:bitmap({
            name = "icon_assaultbox",
            blend_mode = "normal",
            visible = true,
            layer = 0,
            texture = "guis/textures/pdth_hud/hud_icons",
            texture_rect = { 276, 192, 108, 96 },
            w = assault_panel:w(),
            h = assault_panel:h()
        })

        local control_assault_title = assault_panel:text({
            name = "control_assault_title",
            text = managers.localization:text("menu_assault"),
            blend_mode = "normal",
            layer = 1,
            --color = Color.red,
            color = Color(0.6, 0.2, 0.2),
            font_size = const.assault_font_size,
            font = tweak_data.menu.small_font,
            visible = true
        })
       managers.hud:make_fine_text(control_assault_title)
       control_assault_title:set_center_x(icon_assaultbox:center_x())
       control_assault_title:set_top(icon_assaultbox:center_y() - const.assault_y_offset)

        if self._hud_panel:child("point_of_no_return_panel") then
            self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
        end

        local size = 320 * PDTHHud.Options:GetValue("HUD/Scale")
        local point_of_no_return_panel = self._hud_panel:panel({
            name = "point_of_no_return_panel",
            h = 100,
            visible = false,
            w = size,
            x = self._hud_panel:w() - size
        })
        local w = point_of_no_return_panel:w()

        self._noreturn_data = self:_get_noreturn_data()

        local point_of_no_return_text = point_of_no_return_panel:text({
            valign = "center",
            vertical = "center",
            name = "point_of_no_return_text",
            blend_mode = "normal",
            align = "right",
            text = "",
            y = 0,
            x = 0,
			w = "grow",
            layer = 1,
            color = self._noreturn_data.color,
            font_size = const.no_return_t_font_size,
            font = tweak_data.menu.small_font
        })
        -- point_of_no_return_text:set_text(managers.localization:text("time_escape"))
        point_of_no_return_text:set_text(utf8.to_upper(managers.localization:text(self._noreturn_data.text_id, {
		time = ""
	})))
       managers.hud:make_fine_text(point_of_no_return_text)
       local _, _, _, h = point_of_no_return_text:text_rect()
       point_of_no_return_text:set_size(w, h)
       point_of_no_return_text:set_right(point_of_no_return_panel:w())
       point_of_no_return_text:set_top(0)

        local point_of_no_return_timer = point_of_no_return_panel:text({
            name = "point_of_no_return_timer",
            text = "",
            blend_mode = "normal",
            layer = 1,
            color = self._noreturn_data.color,
            font_size = const.no_return_timer_font_size,
            font = tweak_data.menu.small_font
        })
       managers.hud:make_fine_text(point_of_no_return_timer)
        point_of_no_return_timer:set_right(point_of_no_return_text:right())
        point_of_no_return_timer:set_top(point_of_no_return_text:bottom())

        if self._hud_panel:child("casing_panel") then
            self._hud_panel:remove(self._hud_panel:child("casing_panel"))
        end

        local casing_panel = self._hud_panel:panel({
            visible = false,
            name = "casing_panel",
           w = const.casing_size,
           h = const.casing_size
        })
       casing_panel:set_bottom(num_hostages:bottom())
        casing_panel:set_center_x(self._hud_panel:center_x())

        local icon_casingbox = casing_panel:bitmap({
            name = "icon_casingbox",
            blend_mode = "add",
            visible = true,
            texture = "guis/textures/pd2/icon_detection",
            w = casing_panel:w(),
            h = casing_panel:h(),
            y = const.casing_y_offset
        })
        
        if managers.skirmish:is_skirmish() then
            self._assault_color = tweak_data.screen_colors.skirmish_color
        end
        
        local hostage_w = 70
        local hostage_h = 38
        
        local wave_container = self._hud_panel:panel({
            name = "wave_container",
            visible = false,
            w = hostage_w,
            h = hostage_h,
            x = self._hud_panel:w() - hostage_w
        })
        
        if WolfHUD then
            self:setup_wave_display(0, wave_container:left() - 200)
        else
            self:setup_wave_display(0, wave_container:right() - 3)
        end
        
        self._assault_survived_color = Color(1, 0.12549019607843137, 0.9019607843137255, 0.12549019607843137)

    end

    function HUDAssaultCorner:set_buff_enabled(buff_name, enabled)

    end

    function HUDAssaultCorner:_start_assault(text_list)
        local assault_panel = self._hud_panel:child("assault_panel")
        local control_assault_title = assault_panel:child("control_assault_title")
        local icon_assaultbox = assault_panel:child("icon_assaultbox")
        local num_hostages = self._hud_panel:child("num_hostages")
        local casing_panel = self._hud_panel:child("casing_panel")
        local started_now = not self._assault   
        self._assault = true
        assault_panel:set_visible(true)
        num_hostages:set_alpha(0.7)
        casing_panel:set_visible(false)
       self._is_casing_mode = false

       local color = self._assault_color

       if self._assault_mode == "phalanx" then
            color = self._vip_assault_color
           self._fx_color = self._vip_assault_color_fx
        end

       icon_assaultbox:set_color(color)
       control_assault_title:set_color(color)
       
        if not managers.groupai:state():get_hunt_mode() then
            control_assault_title:set_text(managers.localization:text("menu_assault"))
        else            
            icon_assaultbox:set_color(Color(1, 1, 0, 0))
            control_assault_title:set_color(Color(1, 1, 0, 0))
            control_assault_title:set_text("ENDLESS")
        end
       
        local const = PDTHHud.constants
        control_assault_title:set_font_size(const.assault_font_size - 0.2)
        assault_panel:animate(callback(self, self, "flash_assault_title"), true)
        
        if alive(self._wave_bg_box) then
            self._wave_bg_box:stop()
            self._wave_bg_box:animate(callback(self, self, "_animate_wave_started"), self)
        end
        
        if managers.skirmish:is_skirmish() and started_now then
            self:_popup_wave_started()
        end
    end

    function HUDAssaultCorner:sync_set_assault_mode(mode)
        if self._assault_mode == mode then
            return
        end
        self._assault_mode = mode
        local color = self._assault_color
       self._fx_color = self._assault_color_fx
        if mode == "phalanx" then
            color = self._vip_assault_color
           self._fx_color = self._vip_assault_color_fx
        end
        self._current_assault_color = color

    end

    function HUDAssaultCorner:sync_set_assault_mode(mode)
        if self._assault_mode == mode then
            return
        end
        self._assault_mode = mode
        local color = self._assault_color
       self._fx_color = self._assault_color_fx
        if mode == "phalanx" then
            color = self._vip_assault_color
           self._fx_color = self._vip_assault_color_fx
        end
        self:_update_assault_hud_color(color)
    end
    function HUDAssaultCorner:_update_assault_hud_color(color)
       local assault_panel = self._hud_panel:child("assault_panel")
        local control_assault_title = assault_panel:child("control_assault_title")
        local icon_assaultbox = assault_panel:child("icon_assaultbox")
        icon_assaultbox:set_color(color)
        control_assault_title:set_color(color)
    end

    function HUDAssaultCorner:_end_assault()
        local assault_panel = self._hud_panel:child("assault_panel")
        local control_assault_title = assault_panel:child("control_assault_title")
        local icon_assaultbox = assault_panel:child("icon_assaultbox")
        local num_hostages = self._hud_panel:child("num_hostages")
        num_hostages:set_alpha(1)
        
        if not self._assault then
            return
        end
        self._assault = false

       if BetterLightFX then
           BetterLightFX:EndEvent("AssaultIndicator")
       end
       
        assault_panel:set_visible(false)
        assault_panel:stop()
        
        if self:should_display_waves() then
            self._wave_bg_box:stop()
            self._wave_bg_box:animate(callback(self, self, "_animate_wave_completed"), self)
            if PDTHHud.Options:GetValue("HUD/WaveSurvived") then
                assault_panel:set_visible(true)
                local const = PDTHHud.constants
                control_assault_title:set_font_size(const.assault_font_size - 2)
                control_assault_title:set_text("SURVIVED")
                
                control_assault_title:set_color(Color(1, 0.1254902, 0.9019608, 0.1254902))
                icon_assaultbox:set_color(Color(1, 0.1254902, 0.9019608, 0.1254902))
                
                assault_panel:animate(callback(self, self, "flash_assault_title"), true)
                assault_panel:animate(callback(self, self, "_animate_wave_completed"), self)
            end
            if managers.skirmish:is_skirmish() then
                self:_popup_wave_finished()
            end
        end
    end

    function HUDAssaultCorner:set_control_info(data)
        local hostages_panel = self._hud_panel:child("hostages_panel")
        local num_hostages = self._hud_panel:child("num_hostages")
        num_hostages:set_text(managers.localization:text("pdth_hud_hostages") .. " " .. data.nr_hostages)
       self:reposition_hostages()
    end

    function HUDAssaultCorner:reposition_hostages()
       local num_hostages = self._hud_panel:child("num_hostages")
       managers.hud:make_fine_text(num_hostages)
       num_hostages:set_bottom(self._hud_panel:h())
       num_hostages:set_center_x(self._hud_panel:w() / 2)
    end

    function HUDAssaultCorner:_hide_hostages()

    end

    function HUDAssaultCorner:show_casing()
        self:_end_assault()
        local casing_panel = self._hud_panel:child("casing_panel")
       casing_panel:set_visible(true)
        casing_panel:stop()
        casing_panel:animate(callback(self, self, "flash_assault_title"))
        self._casing = true
    end

    function HUDAssaultCorner:hide_casing()
        local casing_panel = self._hud_panel:child("casing_panel")
       casing_panel:set_visible(false)
        casing_panel:stop()
        self._casing = false
    end

    function HUDAssaultCorner:_animate_show_casing(casing_panel, delay_time)

    end

    function HUDAssaultCorner:_animate_text(text_panel, bg_box, color, color_function)

    end

    function HUDAssaultCorner:_show_icon_assaultbox(icon_assaultbox)

    end

    function HUDAssaultCorner:_hide_icon_assaultbox(icon_assaultbox)

    end

    function HUDAssaultCorner:_set_hostage_offseted(is_offseted)
       self:_start_assault()
    end

    function HUDAssaultCorner:show_point_of_no_return_timer(id)
        self:_update_noreturn(id)
        local delay_time = self._assault and 1.2 or 0
        local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
        point_of_no_return_panel:stop()
        point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
        self._point_of_no_return = true
    end

    function HUDAssaultCorner:hide_point_of_no_return_timer()
        self._hud_panel:child("point_of_no_return_panel"):set_visible(false)
        self._point_of_no_return = false
        self:_set_feedback_color(nil)
    end

    function HUDAssaultCorner:_animate_show_noreturn(point_of_no_return_panel, delay_time)
        local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
        local icon_noreturnbox = point_of_no_return_panel:child("icon_noreturnbox")
        local point_of_no_return_text = point_of_no_return_panel:child("point_of_no_return_text")
        local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")

        point_of_no_return_panel:set_visible(false)
        wait(delay_time)
        point_of_no_return_panel:set_visible(true)

       self._PoNR_flashing = true
    end

    function HUDAssaultCorner:feed_point_of_no_return_timer(time, is_inside)
        local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
       local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")
       local point_of_no_return_text = point_of_no_return_panel:child("point_of_no_return_text")

        time = math.floor(time)
        local minutes = math.floor(time / 60)
        local seconds = math.round(time - minutes * 60)
        local text = (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)

        point_of_no_return_timer:set_text(text)
       managers.hud:make_fine_text(point_of_no_return_timer)
        point_of_no_return_timer:set_right(point_of_no_return_text:right())
        point_of_no_return_timer:set_top(point_of_no_return_text:bottom())
    end

    function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
       self._PoNR_flashing = true
       local const = PDTHHud.constants
        local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
        local function flash_timer(o)
            local t = 0
            while t < 0.5 do
                t = t + coroutine.yield()
                local n = 1 - math.sin(t * 180)
                local r = math.lerp(1 or self._point_of_no_return_color.r, 1, n)
                local g = math.lerp(0 or self._point_of_no_return_color.g, 0.8, n)
                local b = math.lerp(0 or self._point_of_no_return_color.b, 0.2, n)
                o:set_color(Color(r, g, b))

               if BetterLightFX then
                   BetterLightFX:StartEvent("PointOfNoReturn")
                   BetterLightFX:SetColor(r, g, b, 1, "PointOfNoReturn")
               end

                o:set_font_size(math.lerp(const.no_return_timer_font_size , const.no_return_timer_font_size_pulse, n))
            end
           if BetterLightFX then
               BetterLightFX:EndEvent("PointOfNoReturn")
           end
        end

        local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")
        point_of_no_return_timer:animate(flash_timer)
    end

    function HUDAssaultCorner:flash_assault_title(o, assault)
        while true do
           local alpha_d = 0.8 + (math.sin( Application:time()*750 )+1)/4
            o:set_alpha(alpha_d)

           if BetterLightFX and self._assault and assault then
               BetterLightFX:StartEvent("AssaultIndicator")
               BetterLightFX:UpdateEvent("AssaultIndicator", {color = Color(alpha_d, self._fx_color.red, self._fx_color.green, self._fx_color.blue)})
           end

            coroutine.yield()
        end
    end
    
    function HUDAssaultCorner:_animate_wave_started(panel, assault_hud)
        local wave_text = panel:child("num_waves")
        local bg = panel:child("bg")

        wave_text:set_text(self:get_completed_waves_string())
        bg:stop()
        bg:animate(callback(nil, _G, "HUDBGBox_animate_bg_attention"), {})
    end
    
    function HUDAssaultCorner:_animate_wave_completed(panel, assault_hud)
        local wave_text = panel:child("num_waves")
        local bg = panel:child("bg")

        wait(1.4)
        wave_text:set_text(self:get_completed_waves_string())
        wait(8.6)
        local assault_panel = self._hud_panel:child("assault_panel")
        assault_panel:set_visible(false)
    end

    function HUDAssaultCorner:_get_noreturn_data(id)
        local noreturn_tweak_data = id and tweak_data.point_of_no_returns[id] or tweak_data.point_of_no_returns.noreturn
        local noreturn_data = {
            color = noreturn_tweak_data.color or Color(1, 1, 0, 0),
            text_id = noreturn_tweak_data.text_id
        }
    
        if not noreturn_data.text_id then
            if _G.IS_VR then
                noreturn_data.text_id = "hud_assault_point_no_return"
            else
                noreturn_data.text_id = "hud_assault_point_no_return_in"
            end
        end
    
        return noreturn_data
    end
    
    function HUDAssaultCorner:_update_noreturn(id)
        local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
        local point_of_no_return_text = point_of_no_return_panel:child("point_of_no_return_text")
        local point_of_no_return_timer = point_of_no_return_panel:child("point_of_no_return_timer")
        local noreturn_data = self:_get_noreturn_data(id)
    
        if noreturn_data.color ~= self._noreturn_data.color then
            point_of_no_return_text:set_color(noreturn_data.color)
            point_of_no_return_timer:set_color(noreturn_data.color)
        end
    
        if noreturn_data.text_id ~= self._noreturn_data.text_id then
            point_of_no_return_text:set_text(managers.localization:to_upper_text(noreturn_data.text_id))
        end
    
        self._noreturn_data = noreturn_data
    end 

end