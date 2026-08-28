
-- [PDTH Hud] Update 247 / Diesel 3.0 字体键强制重定向垫片
-- 旧版 small_font* 系列键在 247 中仍指向旧的合并字体路径，但 DX11 下这些字体资源已不再被引擎正确加载，
-- 导致 GUI 文本存在却不渲染。强制把这些键指向引擎确实能渲染的 pd2_* 等效键（BLT / 原版菜单均实证可用）。
local pd2_small_font = tweak_data.menu.pd2_small_font
local pd2_small_font_size = tweak_data.menu.pd2_small_font_size
local pd2_medium_font = tweak_data.menu.pd2_medium_font
local pd2_medium_font_size = tweak_data.menu.pd2_medium_font_size

if pd2_small_font then
	tweak_data.menu.small_font = pd2_small_font
	tweak_data.menu.small_font_noshadow = pd2_small_font
	tweak_data.hud.small_font = pd2_small_font
	tweak_data.hud_players.timer_font = pd2_small_font
end
if pd2_medium_font then
	tweak_data.hud.medium_font_noshadow = pd2_medium_font
end
if pd2_small_font_size then
	tweak_data.hud.small_font_size = pd2_small_font_size
	tweak_data.menu.small_font_size = pd2_small_font_size
end
if pd2_medium_font_size then
	tweak_data.hud_players.name_size = pd2_medium_font_size
	tweak_data.menu.challenges_font_size = pd2_medium_font_size
end

if PDTHHud.Options:GetValue("HUD/MainHud") and not (restoration and restoration:all_enabled("HUD/MainHUD", "HUD/Teammate")) then
    tweak_data.contour.character.standard_color = Vector3(0.1, 1, 0.5)
    tweak_data.contour.character.friendly_color = Vector3(0.2, 0.8, 1)
    tweak_data.contour.character.downed_color = Vector3(1, 0.5, 0)
    tweak_data.contour.character.dead_color = Vector3(1, 0.1, 0.1)
    tweak_data.contour.character.dangerous_color = Vector3(0.6, 0.2, 0.2)
    tweak_data.contour.character.more_dangerous_color = Vector3(1, 0.1, 0.1)
    tweak_data.contour.character.standard_opacity = 0
    tweak_data.contour.character_interactable.standard_color = Vector3(1, 0.5, 0)
    tweak_data.contour.character_interactable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.interactable.standard_color = Vector3(1, 0.4, 0)
    tweak_data.contour.interactable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.contour_off.standard_color = Vector3(0, 0, 0)
    tweak_data.contour.contour_off.selected_color = Vector3(0, 0, 0)
    tweak_data.contour.contour_off.standard_opacity = 0
    tweak_data.contour.deployable.standard_color = Vector3(0.1, 1, 0.5)
    tweak_data.contour.deployable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.deployable.active_color = Vector3(0.1, 0.5, 1)
    tweak_data.contour.deployable.interact_color = Vector3(0.1, 1, 0.1)
    tweak_data.contour.deployable.disabled_color = Vector3(1, 0.1, 0.1)
    tweak_data.contour.upgradable.standard_color = Vector3(0.1, 0.5, 1)
    tweak_data.contour.upgradable.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.pickup.standard_color = Vector3(0.1, 1, 0.5)
    tweak_data.contour.pickup.selected_color = Vector3(1, 1, 1)
    tweak_data.contour.pickup.standard_opacity = 1
    tweak_data.contour.interactable_icon.standard_color = Vector3(0, 0, 0)
    tweak_data.contour.interactable_icon.selected_color = Vector3(0, 1, 0)
    tweak_data.contour.interactable_icon.standard_opacity = 0

    tweak_data.blackmarket.projectiles.frag_com.icon = "com_frag_grenade"
    PDTHHud.textures:apply_tweak_data_icons()

    tweak_data.hud_icons.cable = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            512,
            49,
            48,
            48
        }
    }

    tweak_data.hud_icons.repair = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            48,
            48,
            48,
            48
        }
    }

    tweak_data.hud_icons.grenade_pdth = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            416,
            384,
            48,
            48
        }
    }
	
    tweak_data.hud_icons.agressor = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            0,
            48,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_drill = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            240,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_bank_manager_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            288,
            144,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_chavez_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_generic_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_planks = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            144,
            288,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_cable_ties = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            384,
            96,
            48,
            48
        }
    }
	
	tweak_data.hud_icons.terrorist_head = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            384,
            48,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_saw = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            144,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_thermite = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            560,
            49,
            48,
            48
        }
    }


    tweak_data.hud_icons.equipment_harddrive = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            272,
            288,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_crowbar = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            240,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_c4 = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            336,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_gasoline = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            288,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_muriatic_acid = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            512,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_hydrogen_chloride = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            560,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_caustic_soda = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            608,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_barcode = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            848,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_glasscutter = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            944,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_ticket = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            800,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_files = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            896,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_harddrive = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            752,
            1,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_evidence = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            656,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_chainsaw = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            704,
            1,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_manifest = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            432,
            192,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_drillfix = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            608,
            49,
            48,
            48
        }
    }


    tweak_data.hud_icons.equipment_fire_extinguisher = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            656,
            49,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_winch_hook = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            704,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_bottle = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            752,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_sleeping_gas = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            800,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_usb_with_data = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            896,
            49,
            48,
            48
        }
    }
    tweak_data.hud_icons.equipment_usb_no_data = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            848,
            49,
            48,
            48
        }
    }
	
	
    tweak_data.hud_icons.equipment_elevator_key = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            192,
            96,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_blow_torch = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            944,
            49,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_printer_ink = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            512,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_plates = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            560,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_paper_roll = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            608,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_stash_server = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            656,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_hand = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            704,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_briefcase = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            752,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_chrome_mask = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            800,
            97,
            48,
            48
        }
    }

    tweak_data.hud_icons.equipment_soda = {
        texture = "guis/textures/pdth_hud/hud_icons",
        texture_rect = {
            848,
            97,
            48,
            48
        }
    }
	
	tweak_data.hud_icons.equipment_body_bag_v2 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        48,
	        464,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_files = {
		texture = "guis/textures/pdth_hud/hud_icons",
		texture_rect = {
			944,
			97,
			48,
			48
		}
	}
	
	tweak_data.hud_icons.interaction_steering_wheel = {
		texture = "guis/textures/pdth_hud/hud_icons",
		texture_rect = {
			896,
			97,
			48,
			48
		}
	}
	
	tweak_data.hud_icons.equipment_cocaine = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_artifact = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.rifle_icon = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        48,
	        0,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_0 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_01 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_02 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_03 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_04 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_05 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_06 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_07 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        145,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_08 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_09 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_clear = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.button_enter = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_medallion = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_scissors = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_pickup = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_pickup_extra = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_chimichanga = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_compounda = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        193,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_compoundb = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_compoundc = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_compoundd = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_compoundok = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_battery = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_button = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_key_chain = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_search = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_valve = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_pull_lever = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        241,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_shopping_bag = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_women_shoes = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_toy = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_goat = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_camera = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_talk = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_stapler = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_vr_set = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_water_tap = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_painting = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        289,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_presidential_pardon = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_toothbrush = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_safe = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_pig = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_pills = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_parachute = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_ladder = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_turtle = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_disassemble_turret = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_zipline = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        337,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_samurai = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_obsidian_plate = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_casino_chips = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_knock = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_pray = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_play_pause = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_empty_cooling_bottle = {
        texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        385,
	        48,
	        48
	    }
    }
	
    tweak_data.hud_icons.equipment_cooling_bottle = {
        texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        385,
	        48,
	        48
	    }
    }
	
	tweak_data.hud_icons.equipment_blueprint = {
        texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        385,
	        48,
	        48
	    }
    }
	
	tweak_data.hud_icons.equipment_roman = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        385,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_tape = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_tape_fingerprint = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_cup = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_feberge_egg = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_record_tape = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_policebadge = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_destroy_evidence = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_boltcutter = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_rfid_tag_02 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_rfid_tag_01 = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        433,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_medal = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_scythe = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_electrical = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_globe = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_timer = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_fertilizer = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_hold_prop_wall_lamp = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_mark_clues = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_restart_timer = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        481,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_take_churros = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        481,
	        48,
	        48
	    }
	}
	--
	tweak_data.hud_icons.interaction_press_frog_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        32,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_ant_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        80,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_bat_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        128,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_boar_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        176,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_bunny_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        224,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_butterfly_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        272,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_crab_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        320,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_crocodile_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        368,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_dog_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        416,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_fish_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        464,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_jaguar_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_lizard_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_millipede_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_monkey_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_owl_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_snail_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_snake_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_spider_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_squirrel_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        529,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_press_turtle_symbol = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        529,
	        48,
	        48
	    }
	}

	tweak_data.hud_icons.equipment_dragon_statue = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        32,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_tea_set = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        80,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_cleaning_product = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        128,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_syringe = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        176,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_notepad = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        224,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_defibrillator = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        272,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_businesscard = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        320,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_table = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        368,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_cargo_strap = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        416,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_car_jack = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        464,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_gnome = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        512,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_audio_device = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        560,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_stock = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        608,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_barrel = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        656,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_receiver = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        704,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_acid = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        752,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_sheriff_star = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        800,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_hammer = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        848,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_silver_ingot = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        896,
	        577,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.equipment_mould = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        944,
	        577,
	        48,
	        48
	    }
	}

	tweak_data.hud_icons.interaction_push = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        32,
	        625,
	        48,
	        48
	    }
	}
	
	tweak_data.hud_icons.interaction_turret = {
	    texture = "guis/textures/pdth_hud/hud_icons",
	    texture_rect = {
	        80,
	        625,
	        48,
	        48
	    }
	}

	tweak_data.hud_icons.interaction_horseshoe = {
			texture = "guis/textures/pdth_hud/hud_icons",
			texture_rect = {
				128,
				625,
				48,
				48
			}
		}
	

    tweak_data.hud_icons.equipment_bfd_tool = tweak_data.hud_icons.equipment_drillfix
	tweak_data.hud_icons.equipment_born_tool = tweak_data.hud_icons.equipment_drillfix
	tweak_data.hud_icons.equipment_liquid_nitrogen_canister = tweak_data.hud_icons.equipment_thermite
	tweak_data.hud_icons.equipment_mayan_gold = tweak_data.hud_icons.interaction_gold
	tweak_data.hud_icons.equipment_flammable = tweak_data.hud_icons.equipment_thermite
	tweak_data.hud_icons.chas_keychain_forklift = tweak_data.hud_icons.equipment_key_chain
	tweak_data.hud_icons.c4_stackable = tweak_data.hud_icons.equipment_c4 
	tweak_data.hud_icons.equipment_documents = tweak_data.hud_icons.equipment_files 
	tweak_data.hud_icons.equipment_gas_canister = tweak_data.hud_icons.equipment_gasoline
	tweak_data.hud_icons.equipment_laptop = tweak_data.hud_icons.laptop_objective

    local conversion = {
        ["guis/textures/hud_icons"] = "guis/textures/pdth_hud/hud_icons",
        ["guis/textures/pd2/hud_swansong"] = "guis/textures/pdth_hud/hud_swansong",
        ["guis/textures/pd2/pd2_waypoints"] = "guis/textures/pdth_hud/pd2_waypoints",
    }

    for k, icon in pairs(tweak_data.hud_icons) do
        if conversion[icon.texture] then
            icon.texture = conversion[icon.texture]
        end
    end

    local self = tweak_data.weapon
    self.ak74.ammo = "rifle_762"
	self.flint.ammo = "rifle_762"
    self.akm.ammo = "rifle_762"
    self.ak5.ammo = "rifle_556"
    self.amcar.ammo = "rifle_556"
    self.m16.ammo = "rifle_556"
    self.tecci.ammo = "rifle_556"
    self.new_m4.ammo = "rifle_556"
    self.sub2000.ammo = "pistol_40"
    self.famas.ammo = "rifle_556"
    self.s552.ammo = "rifle_556"
    self.scar.ammo = "rifle_762"
	self.komodo.ammo = "rifle_762"
	self.hajk.ammo = "rifle_762"
	self.x_hajk.ammo = "rifle_762"
    self.fal.ammo = "rifle_762"
    self.galil.ammo = "rifle_556"
    self.g3.ammo = "rifle_762"
    self.akm_gold.ammo = "rifle_762"
    self.g36.ammo = "rifle_556"
    self.vhs.ammo = "rifle_556"
    self.new_m14.ammo = "rifle_762"
    self.l85a2.ammo = "rifle_556"
    self.aug.ammo = "rifle_556"
    self.asval.ammo = "rifle_762"
    self.saiga.ammo = "shotgun_shell"
    self.b682.ammo = "shotgun_shell"
    self.benelli.ammo = "shotgun_shell"
    self.ksg.ammo = "shotgun_shell"
    self.r870.ammo = "shotgun_shell"
	self.m1897.ammo = "shotgun_shell"
    self.aa12.ammo = "shotgun_shell"
    self.wa2000.ammo = "rifle_762"
    self.mosin.ammo = "rifle_762"
    self.model70.ammo = "rifle_762"
    self.r93.ammo = "snp_44"
	self.r700.ammo = "snp_44"
    self.msr.ammo = "rifle_762"
    self.winchester1874.ammo = "snp_44"
	self.sbl.ammo = "snp_44"
	self.siltstone.ammo = "snp_44"
	self.tti.ammo = "snp_44"	
    self.m95.ammo = "snp_50"
    self.long.ammo = "arrow"
	self.elastic.ammo = "arrow"
    self.flamethrower_mk2.ammo = "fuel_tank"
	self.system.ammo = "fuel_tank"
    self.gre_m79.ammo = "grenade"
	self.arbiter.ammo = "grenade"
	self.slap.ammo = "grenade"
    self.arblast.ammo = "crossbow_bolt"
    self.frankish.ammo = "crossbow_bolt"
    self.saw.ammo = "saw_blade"
    self.m32.ammo = "grenade"
    self.plainsrider.ammo = "arrow"
    self.m134.ammo = "rifle_762"
	self.shuno.ammo = "rifle_762"
    self.hk21.ammo = "rifle_762"
    self.mg42.ammo = "rifle_762"
	self.m60.ammo = "rifle_762"
    self.m249.ammo = "rifle_556"
    self.par.ammo = "rifle_762"
    self.rpk.ammo = "rifle_762"
    self.x_b92fs.ammo = "pistol_9mm"
    self.x_g17.ammo = "pistol_9mm"
    self.jowi.ammo = "pistol_9mm"
    self.x_g22c.ammo = "pistol_9mm"
    self.x_mp5.ammo = "pistol_9mm"
	self.x_shepheard.ammo = "pistol_9mm"
    self.x_1911.ammo = "pistol_45"
    self.x_deagle.ammo = "snp_44"
    self.x_sr2.ammo = "pistol_9mm"
    self.x_akmsu.ammo = "rifle_762"
    self.china.ammo = "grenade"
    self.ms3gl.ammo = "grenade"
    self.rpg7.ammo = "rpg"
    self.hunter.ammo = "crossbow_bolt"
    self.m37.ammo = "shotgun_shell"
    self.serbu.ammo = "shotgun_shell"
    self.striker.ammo = "shotgun_shell"
    self.judge.ammo = "shotgun_shell"
	self.x_judge.ammo = "shotgun_shell"
	self.rota.ammo = "shotgun_shell"
	self.x_rota.ammo = "shotgun_shell"
	self.huntsman.ammo = "shotgun_shell"
	self.coach.ammo = "shotgun_shell"
    self.sparrow.ammo = "pistol_9mm"
	self.x_sparrow.ammo = "pistol_9mm"
    self.b92fs.ammo = "pistol_9mm"
    self.new_raging_bull.ammo = "snp_44"
	self.x_rage.ammo = "snp_44"
	self.model3.ammo = "snp_44"
	self.x_model3.ammo = "snp_44"
	self.scout.ammo = "snp_44"
	self.contraband.ammo = "rifle_762"
	self.chinchilla.ammo = "snp_44"
	self.x_chinchilla.ammo = "snp_44"
    self.c96.ammo = "pistol_9mm"
	self.x_c96.ammo = "pistol_9mm"
    self.glock_17.ammo = "pistol_9mm"
    self.g26.ammo = "pistol_9mm"
    self.g22c.ammo = "pistol_9mm"
    self.colt_1911.ammo = "pistol_45"
    self.deagle.ammo = "snp_44"
	self.lemming.ammo = "snp_44"
	--self.x_lemming.ammo = "snp_44"
    self.ppk.ammo = "pistol_9mm"
	self.x_ppk.ammo = "pistol_9mm"
	self.x_g18c.ammo = "pistol_9mm"
    self.usp.ammo = "pistol_9mm"
	self.x_usp.ammo = "pistol_9mm"
    self.hs2000.ammo = "pistol_9mm"
	self.x_hs2000.ammo = "pistol_9mm"
    self.mateba.ammo = "snp_44"
	self.x_2006m.ammo = "snp_44"
    self.peacemaker.ammo = "snp_44"
	--self.x_peacemaker.ammo = "snp_44"
    self.p226.ammo = "pistol_40"
	self.x_p226.ammo = "pistol_40"
    self.glock_18c.ammo = "pistol_9mm"
    self.pl14.ammo = "pistol_9mm"
	self.x_pl14.ammo = "pistol_9mm"
    self.tec9.ammo = "pistol_9mm"
	self.x_tec9.ammo = "pistol_9mm"
    self.m1928.ammo = "pistol_45"
	self.x_m1928.ammo = "pistol_45"
    self.mp9.ammo = "pistol_9mm"
	self.x_mp9.ammo = "pistol_9mm"
    self.scorpion.ammo = "pistol_9mm"
    self.new_mp5.ammo = "pistol_9mm"
	self.shepheard.ammo = "pistol_9mm"
    self.sr2.ammo = "pistol_9mm"
    self.cobray.ammo = "pistol_9mm"
	self.x_cobray.ammo = "pistol_9mm"
    self.p90.ammo = "rifle_556"
	self.x_p90.ammo = "rifle_556"
    self.akmsu.ammo = "rifle_762"
    self.polymer.ammo = "pistol_9mm"
	self.x_polymer.ammo = "pistol_9mm"
    self.mac10.ammo = "pistol_9mm"
	self.x_mac10.ammo = "pistol_9mm"
    self.baka.ammo = "pistol_45"
	self.x_baka.ammo = "pistol_45"
    self.olympic.ammo = "rifle_556"
    self.hk51b.ammo = "rifle_556"
	self.x_olympic.ammo = "rifle_556"
    self.sterling.ammo = "pistol_9mm"
	self.x_sterling.ammo = "pistol_9mm"
    self.mp7.ammo = "rifle_556"
	self.x_mp7.ammo = "rifle_556"
    self.m45.ammo = "pistol_9mm"
	self.x_m45.ammo = "pistol_9mm"
    self.uzi.ammo = "pistol_9mm"
	self.x_uzi.ammo = "pistol_9mm"
	self.fmg9.ammo = "pistol_9mm"
	self.coal.ammo = "pistol_9mm"
	self.x_coal.ammo = "pistol_9mm"
	self.schakal.ammo = "snp_44"
	self.x_schakal.ammo = "snp_44"
	self.breech.ammo = "snp_44"
	self.x_breech.ammo = "snp_44"
	self.ching.ammo = "rifle_762"
	self.erma.ammo = "pistol_9mm"
	self.x_erma.ammo = "pistol_9mm"
	self.basset.ammo = "shotgun_shell"
	self.ultima.ammo = "shotgun_shell"
	self.x_basset.ammo = "shotgun_shell"
	self.shrew.ammo = "pistol_9mm"
	self.x_shrew.ammo = "pistol_9mm"
	self.legacy.ammo = "pistol_9mm"
	self.x_legacy.ammo = "pistol_9mm"
	self.ecp.ammo = "crossbow_bolt"
	self.corgi.ammo = "rifle_556"
	self.stech.ammo = "pistol_9mm"
	self.x_stech.ammo = "pistol_9mm"
	self.czech.ammo = "pistol_9mm"
	self.x_czech.ammo = "pistol_9mm"
	self.beer.ammo = "pistol_9mm"
	self.x_beer.ammo = "pistol_9mm"
	self.holt.ammo = "pistol_9mm"
	self.x_holt.ammo = "pistol_9mm"
	self.m1911.ammo = "pistol_45"
	self.x_m1911.ammo = "pistol_45"
	self.maxim9.ammo = "pistol_45"
	self.x_maxim9.ammo = "pistol_45"
	self.vityaz.ammo = "rifle_556"
	self.x_vityaz.ammo = "rifle_556"
	self.m590.ammo = "shotgun_shell"
	self.qbu88.ammo = "snp_44"
	self.groza.ammo = "rifle_762"
	self.pm9.ammo = "pistol_9mm"
	self.x_pm9.ammo = "pistol_9mm"
	self.shak12.ammo = "rifle_762"
	self.rsh12.ammo = "snp_44"
	self.type54.ammo = "pistol_9mm"
	self.x_type54.ammo = "pistol_9mm"
	self.hailstorm.ammo = "rifle_556"
    self.korth.ammo = "snp_44"
    self.x_korth.ammo = "snp_44"
	self.sko12.ammo = "shotgun_shell"
	self.x_sko12.ammo = "shotgun_shell"
	self.victor.ammo = "snp_44"
	self.contender.ammo = "snp_44"
    self.hcar.ammo = "rifle_762"
	self.tkb.ammo = "rifle_556"
	
end
local self = tweak_data.interaction
	
	self.copy_machine_smuggle.icon = "equipment_gasoline"
	self.safety_deposit.icon = "interaction_diamond"
	self.paper_pickup.icon = "interaction_diamond"
	self.thermite.icon = "equipment_thermite"
	self.thermite_not_consume.icon = "equipment_thermite"
	self.gasoline.icon = "equipment_gasoline"
	self.gasoline_engine.icon = "equipment_gasoline"
	self.train_car.icon = "interaction_open_door"
	self.walkout_van.icon = "develop"
	self.alaska_plane.icon = "develop"
	self.suburbia_door_crowbar.icon = "equipment_crowbar"
	self.secret_stash_trunk_crowbar.icon = "equipment_crowbar"
	self.requires_crowbar_interactive_template.icon = "equipment_crowbar"
	self.requires_saw_blade.icon = "equipment_saw"
	self.saw_blade.icon = "equipment_saw"
	self.open_slash_close_sec_box.icon = "interaction_open_door"
	self.activate_camera.icon = "equipment_camera"
	self.requires_ecm_jammer_double.icon = "equipment_ecm_jammer"
	self.requires_ecm_jammer.icon = "equipment_ecm_jammer"
	self.requires_ecm_jammer_atm.icon = "equipment_ecm_jammer"
	self.weapon_cache_drop_zone.icon = "rifle_icon"
	self.secret_stash_limo_roof_crowbar.icon = "equipment_crowbar"
	self.suburbia_iron_gate_crowbar.icon = "equipment_crowbar"
	self.apartment_key.icon = "equipment_chavez_key"
	self.hospital_sample_validation_machine.icon = "equipment_vial"
	self.methlab_bubbling.icon = "equipment_muriatic_acid"
	self.methlab_caustic_cooler.icon = "equipment_caustic_soda"
	self.methlab_gas_to_salt.icon = "equipment_hydrogen_chloride"
	self.methlab_drying_meth.icon = "pd2_methlab"
	self.muriatic_acid.icon = "equipment_muriatic_acid"
	self.caustic_soda.icon = "equipment_caustic_soda"
	self.hydrogen_chloride.icon = "equipment_hydrogen_chloride"
	self.elevator_button.icon = "interaction_elevator"
	self.use_computer.icon = "laptop_objective"
	self.elevator_button_roof.icon = "interaction_elevator"
	self.key_double.icon = "equipment_bank_manager_key"
	self.key.icon = "equipment_bank_manager_key"
	self.numpad.icon = "interaction_press_button"
	self.numpad_keycard.icon = "equipment_bank_manager_key"
	self.timelock_panel.icon = "equipment_bank_manager_key"
	self.take_weapons.icon = "rifle_icon"
	self.take_weapons_axis_z.icon = "rifle_icon"
	self.take_weapons_not_active.icon = "rifle_icon"
	self.pick_lock_easy.icon = "locked"
	self.pick_lock_easy_no_skill.icon = "locked"
	self.pick_lock_hard.icon = "locked"
	self.pick_lock_hard_no_skill.icon = "locked"
	self.pick_lock_deposit_transport.icon = "locked"
	self.open_door_with_keys.icon = "equipment_chavez_key"
	self.cant_pick_lock.icon = "locked"
	self.lockpick_int_off.icon = "locked"
	self.no_interact.icon = "locked"
	self.hospital_veil_container.icon = "equipment_vialOK"
	self.hospital_phone.icon = "interaction_answerphone"
	self.hospital_security_cable.icon = "interaction_wirecutter"
	self.hospital_security_cable_red.icon = "interaction_wirecutter"
	self.hospital_security_cable_blue.icon = "interaction_wirecutter"
	self.hospital_security_cable_green.icon = "interaction_wirecutter"
	self.hospital_veil.icon = "equipment_vial"
	self.hospital_veil_take.icon = "equipment_vial"
	self.hospital_sentry.icon = "interaction_sentrygun"
	self.drill.icon = "equipment_drill"
	self.drill_upgrade.icon = "repair"
	self.drill_jammed.icon = "repair"
	self.lance.icon = "equipment_drill"
	self.lance_bbv.icon = "equipment_drill"
	self.lance_jammed.icon = "repair"
	self.lance_upgrade.icon = "repair"
	self.glass_cutter.icon = "equipment_glasscutter"
	self.glass_cutter_jammed.icon = "repair"
	self.hack_ipad.icon = "equipment_hack_ipad"
	self.hack_ipad_bp1.icon = "equipment_hack_ipad"
	self.hack_ipad_jammed.icon = "repair"
	self.hack_suburbia.icon = "equipment_hack_ipad"
	self.hack_suburbia_outline.icon = "equipment_hack_ipad"
	self.hack_suburbia_jammed.icon = "repair"
	self.hack_suburbia_jammed_y.icon = "repair"
	self.hack_suburbia_jammed_axis.icon = "repair"
	self.hack_suburbia_axis.icon = "repair"
	self.security_station.icon = "equipment_hack_ipad"
	self.security_station_keyboard.icon = "interaction_keyboard"
	self.big_computer_hackable.icon = "interaction_keyboard"
	self.big_computer_hackable_axis.icon = "interaction_keyboard"
	self.big_computer_not_hackable.icon = "interaction_keyboard"
	self.big_computer_server.icon = "interaction_keyboard"
	self.security_station_jammed.icon = "repair"
	self.apartment_drill.icon = "equipment_drill"
	self.apartment_drill_jammed.icon = "repair"
	self.suburbia_drill.icon = "equipment_drill"
	self.suburbia_drill_jammed.icon = "repair"
	self.goldheist_drill.icon = "equipment_drill"
	self.goldheist_drill_jammed.icon = "repair"
	self.hospital_saw_teddy.icon = "equipment_saw"
	self.hospital_saw.icon = "equipment_saw"
	self.hospital_saw_jammed.icon = "repair"
	self.apartment_saw.icon = "equipment_saw"
	self.apartment_saw_jammed.icon = "repair"
	self.secret_stash_saw.icon = "equipment_saw"
	self.secret_stash_saw_jammed.icon = "repair"
	self.revive.icon = "interaction_help"
	self.dead.icon = "interaction_help"
	self.free.icon = "interaction_free"
	self.hostage_skm.icon = "interaction_trade"
	self.hostage_trade.icon = "interaction_trade"
	self.hostage_move.icon = "interaction_trade"
	self.hostage_stay.icon = "interaction_trade"
	self.trip_mine.icon = "equipment_trip_mine"
	self.sentry_gun_refill.icon = "interaction_sentrygun"
	self.sentry_gun_revive.icon = "interaction_sentrygun"
	self.sentry_gun.icon = "interaction_sentrygun"
	self.sentry_gun_fire_mode.icon = "interaction_sentrygun"
	self.bodybags_bag.icon = "equipment_body_bag_v2"
	self.grenade_crate.icon = "grenade_pdth"
	self.ammo_bag.icon = "equipment_ammo_bag"
	self.doctor_bag.icon = "equipment_doctor_bag"
	self.ecm_jammer.icon = "equipment_ecm_jammer"
	self.laptop_objective.icon = "laptop_objective"
	self.money_bag.icon = "equipment_money_bag"
	self.apartment_helicopter.icon = "interaction_zipline"
	self.test_interactive_door.icon = "interaction_open_door"
	self.press_to_interact.icon = "interaction_press_button"
	self.test_interactive_door_one_direction.icon = "interaction_open_door"
	self.temp_interact_box.icon = "interaction_powerbox"
	self.requires_cable_ties.icon = "equipment_cable_ties"
	self.temp_interact_box_no_timer.icon = "interaction_powerbox"
	self.access_camera.icon = "laptop_objective"
	self.access_camera_x_axis.icon = "laptop_objective"
	self.driving_console.icon = "interaction_steering_wheel"
	self.driving_drive.icon = "interaction_steering_wheel"
	self.interaction_ball.icon = "cable"
	self.invisible_interaction_open.icon = "interaction_open_door"
	self.invisible_interaction_open_axis.icon = "interaction_open_door"
	self.fork_lift_sound.icon = "interaction_press_button"
	self.money_briefcase.icon = "interaction_money_wrap"
	self.grenade_briefcase.icon = "equipment_briefcase"
	self.cash_register.icon = "interaction_open_door"
	self.atm_interaction.icon = "interaction_open_door"
	self.bank_open_interaction.icon = "interaction_open_door"
	self.weapon_case.icon = "rifle_icon"
	self.weapon_case_axis_z.icon = "rifle_icon"
	self.weapon_case_close.icon = "rifle_icon"
	self.invisible_interaction_close.icon = "equipment_money_bag"
	self.interact_gen_pku_loot_take.icon = "equipment_money_bag"
	self.water_tap.icon = "interaction_water_tap"
	self.water_manhole.icon = "repair"
	self.sewer_manhole.icon = "interaction_open_door"
	self.circuit_breaker.icon = "interaction_powerbox"
	self.circuit_breaker_off.icon = "interaction_powerbox"
	self.hold_circuit_breaker.icon = "interaction_powerbox"
	self.transformer_box.icon = "interaction_powerbox"
	self.stash_server_cord.icon = "interaction_powercord"
	self.stash_planks.icon = "equipment_planks"
	self.stash_planks_pickup.icon = "equipment_planks"
	self.stash_server.icon = "equipment_stash_server"
	self.stash_server_pickup.icon = "equipment_stash_server"
	self.shelf_sliding_suburbia.icon = "interaction_push"
	self.tear_painting.icon = "equipment_painting"
	self.ejection_seat_interact.icon = "equipment_ejection_seat"
	self.diamond_pickup.icon = "interaction_diamond"
	self.diamond_pickup_pal.icon = "interaction_diamond"
	self.safe_loot_pickup.icon = "interaction_diamond"
	self.mus_pku_artifact.icon = "equipment_artifact"
	self.tiara_pickup.icon = "interaction_diamond"
	self.patientpaper_pickup.icon = "interaction_patientfile"
	self.diamond_case.icon = "interaction_diamond"
	self.diamond_single_pickup.icon = "interaction_diamond"
	self.diamond_single_pickup_axis.icon = "interaction_diamond"
	self.suburbia_necklace_pickup.icon = "interaction_diamond"
	self.temp_interact_box2.icon = "interaction_wirecutter"
	self.printing_plates.icon = "equipment_plates"
	self.c4.icon = "equipment_c4"
	self.c4_mission_door.icon = "equipment_c4"
	self.c4_diffusible.icon = "equipment_c4"
	self.open_trunk.icon = "interaction_open_door"
	self.open_door.icon = "interaction_open_door"
	self.embassy_door.icon = "interaction_open_door"
	self.c4_special.icon = "equipment_c4"
	self.c4_bag.icon = "equipment_c4"
	self.money_wrap.icon = "interaction_money_wrap"
	self.money_wrap_axis.icon = "interaction_money_wrap"
	self.weapon_case_axis_x.icon = "rifle_icon"
	self.suburbia_money_wrap.icon = "interaction_money_wrap"
	self.money_wrap_single_bundle.icon = "interaction_money_wrap"
	self.christmas_present.icon = "interaction_christmas_present"
	self.gold_pile.icon = "interaction_gold"
	self.gold_pile_axis_x.icon = "interaction_gold"
	self.gold_bag.icon = "interaction_gold"
	self.requires_gold_bag.icon = "interaction_gold"
	self.intimidate.icon = "equipment_cable_ties"
	self.intimidate_and_search.icon = "equipment_cable_ties"
	self.intimidate_with_contour.icon = "equipment_cable_ties"
	self.intimidate_and_search_with_contour.icon = "equipment_cable_ties"
	self.computer_test.icon = "interaction_keyboard"
	self.carry_drop.icon = "equipment_money_bag"
	self.painting_carry_drop.icon = "equipment_painting"
	self.corpse_alarm_pager.icon = "interaction_answerphone"
	self.corpse_dispose.icon = "equipment_hand"
	self.shaped_sharge.icon = "equipment_c4"
	self.shaped_charge_single.icon = "equipment_c4"
	self.hostage_convert.icon = "interaction_trade"
	self.break_open.icon = "interaction_wirecutter"
	self.cut_fence.icon = "interaction_wirecutter"
	self.burning_money.icon = "agressor"
	self.hold_take_painting.icon = "equipment_painting"
	self.barricade_fence.icon = "equipment_planks"
	self.hack_numpad.icon = "equipment_hack_ipad"
	self.pickup_phone.icon = "equipment_hack_ipad"
	self.pickup_tablet.icon = "equipment_hack_ipad"
	self.hold_take_server.icon = "equipment_stash_server"
	self.hold_take_server_axis.icon = "equipment_stash_server"
	self.hold_take_blueprints.icon = "equipment_files"
	self.take_confidential_folder.icon = "interaction_files"
	self.take_confidential_folder_event.icon = "interaction_files"
	self.hold_take_gas_can.icon = "equipment_gasoline"
	self.gen_ladyjustice_statue.icon = "interaction_pull_lever"
	self.hold_place_gps_tracker.icon = "equipment_hack_ipad"
	self.keyboard_no_time.icon = "interaction_keyboard"
	self.keyboard_eday_1.icon = "interaction_keyboard"
	self.keyboard_eday_2.icon = "interaction_keyboard"
	self.keyboard_hox_1.icon = "interaction_keyboard"
	self.hold_use_computer.icon = "laptop_objective"
	self.use_server_device.icon = "equipment_stash_server"
	self.iphone_answer.icon = "interaction_answerphone"
	self.use_flare.icon = "agressor"
	self.steal_methbag.icon = "equipment_cocaine"
	self.pickup_keycard.icon = "equipment_bank_manager_key"
	self.open_from_inside.icon = "interaction_open_door"
	self.open_hatch_generic.icon = "interaction_open_door"
	self.money_luggage.icon = "interaction_money_wrap"
	self.hold_pickup_lance.icon = "equipment_drill"
	self.barrier_numpad.icon = "equipment_hack_ipad"
	self.timelock_numpad.icon = "equipment_hack_ipad"
	self.pickup_asset.icon = "equipment_key_chain"
	self.open_slash_close.icon = "interaction_open_door"
	self.open_slash_close_act.icon = "interaction_open_door"
	self.just_close.icon = "interaction_open_door" 
	self.raise_balloon.icon = "equipment_ejection_seat"
	self.stn_int_place_camera.icon = "equipment_camera"
	self.stn_int_take_camera.icon = "equipment_camera"
	self.exit_to_crimenet.icon = "interaction_open_door"
	self.gage_assignment.icon = "interaction_pickup"
	self.gen_pku_fusion_reactor.icon = "repair"
	self.gen_pku_cocaine.icon = "equipment_cocaine"
	self.gen_pku_artifact_statue.icon = "equipment_artifact"
	self.gen_pku_artifact.icon = "equipment_artifact"
	self.gen_pku_artifact_painting.icon = "equipment_painting"
	self.gen_pku_jewelry.icon = "interaction_diamond"
	self.taking_meth.icon = "equipment_cocaine"
	self.gen_pku_crowbar.icon = "equipment_crowbar"
	self.gen_pku_crowbar_stack.icon = "equipment_crowbar"
	self.gen_pku_thermite.icon = "equipment_thermite"
	self.gen_pku_thermite_paste.icon = "equipment_thermite"
	self.gen_pku_thermite_paste_not_deployable.icon = "equipment_thermite"
	self.button_infopad.icon = "interaction_press_button"
	self.crate_loot.icon = "equipment_crowbar"
	self.crate_loot_crowbar.icon = "equipment_crowbar"
	self.weapon_case_not_active.icon = "rifle_icon"
	self.crate_weapon_crowbar.icon = "equipment_crowbar"
	self.crate_loot_close.icon = "equipment_crowbar"
	self.halloween_trick.icon = "develop"
	self.disassemble_turret.icon = "interaction_disassemble_turret"
	self.take_ammo.icon = "equipment_ammo_bag"
	self.bank_note.icon = "interaction_search"
	self.pickup_boards.icon = "equipment_planks"
	self.need_boards.icon = "equipment_planks"
	self.uload_database.icon = "interaction_keyboard"
	self.uload_database_jammed.icon = "repair"
	self.votingmachine2.icon = "equipment_hack_ipad"
	self.votingmachine2_jammed.icon = "repair"
	self.sc_tape_loop.icon = "equipment_camera"
	self.money_scanner.icon = "equipment_hack_ipad"
	self.money_small.icon = "interaction_money_wrap"
	self.money_small_take.icon = "interaction_money_wrap"
	self.shape_charge_plantable.icon = "equipment_c4"
	self.player_zipline.icon = "interaction_zipline"
	self.bag_zipline.icon = "interaction_zipline"
	self.huge_lance.icon = "equipment_drill"
	self.huge_lance_jammed.icon = "repair"
	self.gen_pku_lance_part.icon = "equipment_drill"
	self.crane_joystick_left.icon = "interaction_press_button"
	self.crane_joystick_lift.icon = "interaction_press_button"
	self.crane_joystick_right.icon = "interaction_press_button"
	self.crane_joystick_release.icon = "interaction_press_button"
	self.gen_int_thermite_rig.icon = "equipment_thermite"
	self.gen_int_thermite_apply.icon = "equipment_thermite"
	self.apply_thermite_paste.icon = "equipment_thermite"
	self.set_off_alarm.icon = "interaction_knock"
	self.hold_open_vault.icon = "interaction_open_door"
	self.hold_open_vault_2s.icon = "interaction_open_door"
	self.samurai_armor.icon = "equipment_samurai"
	self.fingerprint_scanner.icon = "equipment_hand"
	self.enter_code.icon = "equipment_hack_ipad"
	self.take_keys.icon = "equipment_key_chain"
	self.push_button.icon = "interaction_press_button"
	self.use_chute.icon = "equipment_drillfix"
	self.breach_door.icon = "equipment_crowbar"
	self.bus_wall_phone.icon = "interaction_answerphone"
	self.zipline_mount.icon = "equipment_drillfix"
	self.rewire_timelock.icon = "interaction_wirecutter"
	self.pick_lock_x_axis.icon = "locked"
	self.money_wrap_single_bundle_active.icon = "interaction_money_wrap"
	self.pku_barcode_downtown.icon = "equipment_barcode"
	self.pku_barcode_brickell.icon = "equipment_barcode"
	self.pku_barcode_edgewater.icon = "equipment_barcode"
	self.pku_barcode_isles_beach.icon = "equipment_barcode"
	self.pku_barcode_opa_locka.icon = "equipment_barcode"
	self.read_barcode_downtown.icon = "equipment_barcode"
	self.read_barcode_brickell.icon = "equipment_barcode"
	self.read_barcode_edgewater.icon = "equipment_barcode"
	self.read_barcode_isles_beach.icon = "equipment_barcode"
	self.read_barcode_opa_locka.icon = "equipment_barcode"
	self.read_barcode_activate.icon = "equipment_barcode"
	self.hlm_motor_start.icon = "interaction_steering_wheel"
	self.hlm_connect_equip.icon = "equipment_drillfix"
	self.hlm_roll_carpet.icon = "equipment_hand"
	self.hold_pku_equipmentbag.icon = "equipment_c4"
	self.hold_pku_briefcase.icon = "equipment_briefcase"
	self.disarm_bomb.icon = "equipment_c4"
	self.pku_take_mask.icon = "equipment_chrome_mask"
	self.hold_activate_sprinklers.icon = "interaction_valve"
	self.hold_hlm_open_circuitbreaker.icon = "interaction_wirecutter"
	self.hold_remove_cover.icon = "develop"
	self.hold_cut_cable.icon = "interaction_wirecutter"
	self.firstaid_box.icon = "equipment_doctor_bag"
	self.first_aid_kit.icon = "equipment_first_aid_kit"
	self.road_spikes.icon = "repair"
	self.grab_server.icon = "equipment_stash_server"
	self.pickup_harddrive.icon = "equipment_harddrive"
	self.place_harddrive.icon = "equipment_harddrive"
	self.invisible_interaction_searching.icon = "interaction_search"
	self.invisible_interaction_gathering.icon = "equipment_evidence"
	self.invisible_interaction_checking.icon = "interaction_search"
	self.take_medical_supplies.icon = "equipment_doctor_bag"
	self.search_files_false.icon = "interaction_search"
	self.use_files.icon = "equipment_files"
	self.hack_electric_box.icon = "interaction_powerbox"
	self.take_ticket.icon = "equipment_ticket"
	self.use_ticket.icon = "equipment_ticket"
	self.hold_signal_driver.icon = "interaction_knock"
	self.hold_hack_comp.icon = "interaction_keyboard"
	self.hold_approve_req.icon = "interaction_keyboard"
	self.hold_download_keys.icon = "equipment_harddrive"
	self.hold_analyze_evidence.icon = "interaction_keyboard"
	self.take_bridge.icon = "equipment_planks"
	self.use_bridge.icon = "equipment_planks"
	self.hold_close_keycard.icon = "equipment_bank_manager_key"
	self.hold_close.icon = "interaction_open_door"
	self.hold_open.icon = "interaction_open_door"
	self.hold_move_car.icon = "interaction_steering_wheel"
	self.hold_remove_armor_plating.icon = "equipment_drillfix"
	self.gen_pku_cocaine_pure.icon = "equipment_cocaine"
	self.gen_pku_sandwich.icon = "equipment_chimichanga"
	self.place_flare.icon = "agressor"
	self.ignite_flare.icon = "agressor"
	self.hold_open_xmas_present.icon = "interaction_christmas_present"
	self.c4_bag_dynamic.icon = "equipment_c4"
	self.shape_charge_plantable_c4_1.icon = "equipment_c4"
	self.shape_charge_plantable_c4_x1.icon = "equipment_c4"
	self.hold_call_captain.icon = "interaction_answerphone"
	self.hold_pku_disassemble_cro_loot.icon = "equipment_c4"
	self.hold_remove_ladder.icon = "interaction_ladder"
	self.connect_hose.icon = "cable"
	self.hold_generator_start.icon = "interaction_press_button"
	self.hold_open_bomb_case.icon = "equipment_c4"
	self.press_c4_pku.icon = "equipment_c4"
	self.open_train_cargo_door.icon = "interaction_open_door"
	self.close_train_cargo_door.icon = "interaction_open_door"
	self.take_chainsaw.icon = "equipment_chainsaw"
	self.use_chainsaw.icon = "equipment_chainsaw"
	self.hack_ship_control.icon = "interaction_keyboard"
	self.move_ship_gps_coords.icon = "interaction_keyboard"
	self.pku_manifest.icon = "equipment_manifest"
	self.c4_x1_bag.icon = "equipment_c4"
	self.cut_glass.icon = "equipment_glasscutter"
	self.mus_hold_open_display.icon = "interaction_open_door"
	self.mus_take_diamond.icon = "interaction_diamond"
	self.rewire_electric_box.icon = "interaction_powerbox"
	self.timelock_hack.icon = "equipment_hack_ipad"
	self.hold_unlock_car.icon = "equipment_chavez_key"
	self.gen_pku_evidence_bag.icon = "equipment_evidence"
	self.gen_pku_evidence_bag_axis.icon = "equipment_evidence"
	self.mcm_fbi_case.icon = "equipment_evidence"
	self.mcm_fbi_taperecorder.icon = "interaction_play_pause"
	self.mcm_laptop.icon = "laptop_objective"
	self.mcm_laptop_code.icon = "laptop_objective"
	self.mcm_break_planks.icon = "equipment_planks"
	self.mcm_panicroom_keycard.icon = "equipment_bank_manager_key"
	self.mcm_panicroom_keycard_2.icon = "equipment_bank_manager_key"
	self.gen_prop_container_a_vault_seq.icon = "equipment_crowbar"
	self.gen_pku_warhead.icon = "equipment_c4"
	self.gen_pku_warhead_box.icon = "equipment_c4"
	self.gen_pku_circle_cutter.icon = "equipment_glasscutter"
	self.hold_circle_cutter.icon = "equipment_glasscutter"
	self.circle_cutter_jammed.icon = "repair"
	self.answer_call.icon = "interaction_answerphone"
	self.hold_take_fire_extinguisher.icon = "equipment_fire_extinguisher"
	self.hold_extinguish_fire.icon = "equipment_fire_extinguisher"
	self.are_laptop.icon = "laptop_objective"
	self.hold_search_c4.icon = "interaction_search"
	self.c4_x10.icon = "equipment_c4"
	self.pick_lock_hard_no_skill_deactivated.icon = "locked"
	self.are_turn_on_tv.icon = "laptop_objective"
	self.money_wrap_updating.icon = "interaction_money_wrap"
	self.panic_room_key.icon = "equipment_chavez_key"
	self.hack_skylight_barrier.icon = "equipment_hack_ipad"
	self.take_bottle.icon = "equipment_bottle"
	self.pour_spiked_drink.icon = "equipment_bottle"
	self.computer_blueprints.icon = "equipment_files"
	self.use_blueprints.icon = "equipment_files"
	self.send_blueprints.icon = "interaction_press_button"
	self.cas_customer_database.icon = "interaction_keyboard"
	self.disable_lasers.icon = "interaction_keyboard"
	self.pickup_hotel_room_keycard.icon = "equipment_bank_manager_key"
	self.use_hotel_room_key.icon = "equipment_bank_manager_key"
	self.use_hotel_room_key_no_access.icon = "equipment_bank_manager_key"
	self.lift_choose_floor.icon = "interaction_elevator"
	self.cas_open_briefcase.icon = "equipment_briefcase"
	self.cas_open_securityroom_door.icon = "locked"
	self.cas_elevator_door_open.icon = "interaction_elevator"
	self.cas_elevator_door_close.icon = "interaction_elevator"
	self.lockpick_locker.icon = "locked"
	self.cas_copy_usb.icon = "equipment_usb_no_data"
	self.cas_use_usb.icon = "equipment_usb_no_data"
	self.cas_take_usb_key.icon = "equipment_usb_no_data"
	self.cas_take_usb_key_data.icon = "equipment_usb_with_data"
	self.cas_screw_down.icon = "equipment_drillfix"
	self.cas_start_winch.icon = "interaction_press_button"
	self.cas_take_hook.icon = "equipment_winch_hook"
	self.cas_start_drill.icon = "equipment_drill"
	self.cas_stop_drill.icon = "equipment_drill"
	self.cas_start_drill.icon = "equipment_drill"
	self.cas_take_empty_watertank.icon = "equipment_empty_cooling_bottle"
	self.cas_take_full_watertank.icon = "equipment_cooling_bottle"
	self.cas_vent_gas.icon = "equipment_sleeping_gas"
	self.cas_connect_power.icon = "interaction_powercord"
	self.cas_take_sleeping_gas.icon = "equipment_sleeping_gas"
	self.cas_chips_pile.icon = "equipment_casino_chips"
	self.cas_connect_winch_hook.icon = "equipment_winch_hook"
	self.cas_open_powerbox.icon = "interaction_powerbox"
	self.cas_take_fireworks_bag.icon = "agressor"
	self.cas_ignite_fireworks.icon = "agressor"
	self.cas_open_compartment.icon = "interaction_open_door"
	self.cas_bfd_drill_toolbox.icon = "equipment_drillfix"
	self.cas_fix_bfd_drill.icon = "equipment_drillfix"
	self.cas_elevator_key.icon = "interaction_elevator"
	self.cas_use_elevator_key.icon = "interaction_elevator"
	self.cas_open_door.icon = "interaction_open_door"
	self.cas_close_door.icon = "interaction_open_door"
	self.cas_slot_machine.icon = "interaction_pull_lever"
	self.cas_button_01.icon = "button_01"
	self.cas_button_02.icon = "button_02"
	self.cas_button_03.icon = "button_03"
	self.cas_button_04.icon = "button_04"
	self.cas_button_05.icon = "button_05"
	self.cas_button_06.icon = "button_06"
	self.cas_button_07.icon = "button_07"
	self.cas_button_08.icon = "button_08"
	self.cas_button_09.icon = "button_09"
	self.cas_button_0.icon = "button_0"
	self.cas_button_clear.icon = "button_clear"
	self.cas_button_enter.icon = "button_enter"
	self.cas_skylight_panel.icon = "equipment_hack_ipad"
	self.cas_take_unknown.icon = "equipment_evidence"
	self.cas_unpack_turret.icon = "interaction_disassemble_turret"
	self.cas_open_guitar_case.icon = "interaction_open_door"
	self.cas_take_gear.icon = "equipment_chrome_mask"
	self.cas_security_door.icon = "locked"
	self.pick_lock_30.icon = "locked"
	self.winning_slip.icon = "equipment_casino_chips"
	self.pku_safe.icon = "equipment_safe"
	self.gen_pku_saw.icon = "equipment_saw"
	self.gen_pku_saw_axis.icon = "equipment_saw"
	self.gen_int_saw.icon = "equipment_saw"
	self.gen_int_saw_jammed.icon = "repair"
	self.gen_int_saw_upgrade.icon = "equipment_saw"
	self.safe_carry_drop.icon = "equipment_safe"
	self.hold_pku_knife.icon = "terrorist_head"
	self.c4_consume.icon = "equipment_c4"
	self.gen_pku_thermite_timer.icon = "equipment_thermite"
	self.red_no_key.icon = "interaction_press_button"
	self.s_cube.icon = "interaction_powerbox"
	self.red_open_shutters.icon = "interaction_press_button"
	self.red_close_shutters.icon = "interaction_press_button"
	self.pd1_drill.icon = "equipment_drill"
	self.hold_open_vent.icon = "interaction_wirecutter"
	self.press_open_truck.icon = "interaction_open_door"
	self.red_take_envelope.icon = "interaction_files"
	self.din_crane_control.icon = "interaction_press_button"
	self.din_hold_ignite_trap.icon = "agressor"
	self.pku_pig.icon = "equipment_pig"
	self.pku_pills.icon = "equipment_pills"
	self.taking_meth_huge.icon = "equipment_cocaine"
	self.bry_control_jammed.icon = "repair"
	self.hold_plant_breaching_charge.icon = "equipment_c4"
	self.hold_pku_breaching_charges.icon = "equipment_c4"
	self.hold_unlock_display_ares.icon = "laptop_objective"
	self.hold_unlock_display_chronos.icon = "laptop_objective"
	self.hold_unlock_display_demeter.icon = "laptop_objective"
	self.hold_unlock_display_hades.icon = "laptop_objective"
	self.hold_unlock_display_poseidon.icon = "laptop_objective"
	self.hold_unlock_display_zeus.icon = "laptop_objective"
	self.gen_pku_blow_torch.icon = "equipment_blow_torch"
	self.hold_blow_torch.icon = "equipment_blow_torch"
	self.hold_breaching_detonator.icon = "equipment_c4"
	self.hold_breaching_detonator_rearm.icon = "equipment_c4"
	self.bry_pku_prototype.icon = "rifle_icon"
	self.parachute_carry_drop.icon = "equipment_parachute"
	self.hold_take_parachute.icon = "equipment_parachute"
	self.hold_place_strap.icon = "equipment_drillfix"
	self.hold_take_paper_roll.icon = "equipment_paper_roll"
	self.hold_take_counterfeit_money.icon = "interaction_money_wrap"
	self.hold_start_printer.icon = "interaction_press_button"
	self.hold_insert_printer_ink.icon = "equipment_printer_ink"
	self.press_printer_ink.icon = "equipment_printer_ink"
	self.press_printer_paper.icon = "equipment_paper_roll"
	self.hold_insert_paper_roll.icon = "equipment_paper_roll"
	self.press_plates.icon = "equipment_plates"
	self.press_plates_invis.icon = "equipment_plates"
	self.hold_insert_plates.icon = "equipment_plates"
	self.man_apply_tape.icon = "equipment_hand"
	self.man_remove_bars.icon = "equipment_hand"
	self.hold_pku_present.icon = "interaction_christmas_present"
	self.hold_grab_goat.icon = "equipment_goat"
	self.goat_carry_drop.icon = "equipment_goat"
	self.hold_remove_debris.icon = "equipment_planks"
	self.man_trunk_picklock.icon = "locked"
	self.stash_server_pickup_server.icon = "equipment_stash_server"
	self.drk_hold_hack_computer.icon = "laptop_objective"
	self.hold_electric_lock.icon = "interaction_open_door"
	self.hold_pku_drk_bomb_part.icon = "equipment_c4"
	self.drk_pku_blow_torch.icon = "equipment_blow_torch"
	self.access_camera_y_axis.icon = "equipment_camera"
	self.money_wrap_single_bundle_dyn.icon = "interaction_money_wrap"
	self.gen_pku_thermite_paste_z_axis.icon = "equipment_thermite"
	self.hold_open_vent_dark.icon = "interaction_wirecutter"
	self.dark_screw_down.icon = "interaction_wirecutter"
	self.hold_start_scan.icon = "interaction_press_button"
	self.hold_start_scan_hand.icon = "equipment_hand"
	self.hold_remove_hand.icon = "equipment_hand"
	self.hold_open_bomb_hatch.icon = "interaction_wirecutter"
	self.hold_start_bomb_charge.icon = "equipment_c4"
	self.gen_pku_body.icon = "equipment_hand"
	self.hold_fire_missile.icon = "agressor"
	self.hold_turn_off_gas.icon = "interaction_valve"
	self.hold_born_search_tools.icon = "interaction_search"
	self.born_give_item.icon = "equipment_caustic_soda"
	self.hold_born_take_bike_part.icon = "repair"
	self.hold_born_take_bike_part_y_axis.icon = "repair"
	self.hold_born_ride_the_bike.icon = "interaction_steering_wheel"
	self.hold_born_untie.icon = "interaction_free"
	self.hold_born_soda.icon = "equipment_soda"
	self.hold_born_receive_item_blow_torch.icon = "equipment_blow_torch"
	self.hold_hand_over_soda.icon = "equipment_soda"
	self.hold_hand_over_tool.icon = "equipment_drillfix"
	self.hold_hand_over_chrome_skull.icon = "equipment_chrome_mask"
	self.born_plug_in_powercord.icon = "interaction_powercord"
	self.hold_open_door.icon = "interaction_open_door"
	self.hold_open_door_no_axis.icon = "interaction_open_door"
	self.hold_open_hatch.icon = "interaction_open_door"
	self.ring_band.icon = "interaction_diamond"
	self.fbi_usb_insert.icon = "equipment_usb_no_data"
	self.hold_release_hatch.icon = "equipment_planks"
	self.hold_open_case.icon = "interaction_open_door"
	self.hold_take_helmet.icon = "equipment_vr_set"
	self.press_pick_up.icon = "interaction_pickup_extra"
	self.press_new_paintjob.icon = "interaction_press_button"
	self.press_anwser_machine.icon = "interaction_press_button"
	self.press_shoot_puck.icon = "equipment_hand"
	self.press_play_music.icon = "interaction_play_pause"
	self.press_stop_music.icon = "interaction_play_pause"
	self.press_spin_wheel.icon = "interaction_valve"
	self.press_bet_red.icon = "equipment_casino_chips"
	self.press_bet_black.icon = "equipment_casino_chips"
	self.hold_burn_offshore_money.icon = "agressor"
	self.press_reset_damage_counter.icon = "interaction_press_button"
	self.play_bank_invaders.icon = "laptop_objective"
	self.access_fbi_files.icon = "equipment_hack_ipad"
	self.access_pd2stash.icon = "equipment_hack_ipad"
	self.access_sidejobs.icon = "laptop_objective"
	self.access_weapon_primary.icon = "rifle_icon"
	self.access_weapon_secondary.icon = "rifle_icon"
	self.chl_slot_machine.icon = "interaction_pull_lever"
	self.talk_to_heister_butler.icon = "interaction_talk"
	self.talk_to_heister_dallas.icon = "interaction_talk"
	self.talk_to_heister_chains.icon = "interaction_talk"
	self.talk_to_heister_wolf.icon = "interaction_talk"
	self.talk_to_heister_hoxton.icon = "interaction_talk"
	self.talk_to_heister_old_hoxton.icon = "interaction_talk"
	self.talk_to_heister_jimmy.icon = "interaction_talk"
	self.talk_to_heister_myh.icon = "interaction_talk"
	self.talk_to_heister_joy.icon = "interaction_talk"
	self.talk_to_heister_bonnie.icon = "interaction_talk"
	self.talk_to_heister_sydney.icon = "interaction_talk"
	self.talk_to_heister_wild.icon = "interaction_talk"
	self.talk_to_heister_ecp_male.icon = "interaction_talk"
	self.talk_to_heister_ecp_female.icon = "interaction_talk"
	self.talk_to_heister_clover.icon = "interaction_talk"
	self.talk_to_heister_max.icon = "interaction_talk"
	self.talk_to_heister_terry.icon = "interaction_talk"
	self.talk_to_heister_bodhi.icon = "interaction_talk"
	self.talk_to_heister_dragon.icon = "interaction_talk"
	self.talk_to_heister_sokol.icon = "interaction_talk"
	self.talk_to_heister_jacket.icon = "interaction_talk"
	self.talk_to_heister_dragan.icon = "interaction_talk"
	self.talk_to_heister_jowi.icon = "interaction_talk"
	self.jiro_no_interaction.icon = "interaction_talk"
	self.press_start_weapon_course.icon = "interaction_press_button"
	self.pku_scubagear_tank.icon = "equipment_chrome_mask"
	self.pku_scubagear_vest.icon = "equipment_soda"
	self.glc_open_door.icon = "interaction_open_door"
	self.glc_hold_take_handcuffs.icon = "interaction_free"
	self.pku_toothbrush.icon = "equipment_toothbrush"
	self.hold_insert_keycard_hlp.icon = "equipment_bank_manager_key"
	self.c4_consume_x1.icon = "equipment_c4"
	self.repair_wheel.icon = "repair"
	self.hold_pull_switch.icon = "interaction_powerbox"
	self.sfm_take_usb_key.icon = "equipment_usb_no_data"
	self.hold_attach_magnet.icon = "repair"
	self.hold_open_coke_bag.icon = "equipment_cocaine"
	self.hold_remove_bug.icon = "equipment_audio_device"
	self.hold_open_lid.icon = "interaction_open_door"
	self.hold_unfold_ladder.icon = "interaction_ladder"
	self.sfm_laptop.icon = "equipment_usb_no_data"
	self.rewire_friend_fuse_box.icon = "interaction_powerbox"
	self.hold_phone_call_office.icon = "interaction_answerphone"
	self.friend_pku_yayo_cocaine.icon = "equipment_cocaine"
	self.pickup_keys.icon = "equipment_chavez_key"
	self.pickup_case.icon = "equipment_briefcase"
	self.hold_open_shopping_bag.icon = "interaction_shopping_bag"
	self.hold_take_toy.icon = "equipment_toy"
	self.hold_take_wine.icon = "equipment_bottle"
	self.hold_take_expensive_wine.icon = "equipment_bottle"
	self.hold_take_diamond_necklace.icon = "interaction_diamond"
	self.hold_take_vr_headset.icon = "equipment_vr_set"
	self.hold_take_shoes.icon = "equipment_women_shoes"
	self.hold_search_computer.icon = "interaction_keyboard"
	self.hold_moon_untie.icon = "interaction_free"
	self.hold_take_mask.icon = "equipment_chrome_mask"
	self.hold_moon_attach_winch.icon = "equipment_winch_hook"
	self.hold_friend_attach_winch.icon = "equipment_winch_hook"
	self.c4_consume_x3.icon = "equipment_c4"
	self.hold_search_cigar_boxes.icon = "interaction_search"
	self.money_wrap_active.icon = "interaction_money_wrap"
	self.hold_search_capsule.icon = "interaction_search"
	self.hold_search_cart.icon = "interaction_search"
	self.hold_open_window.icon = "interaction_open_door"
	self.hold_close_window.icon = "interaction_open_door"
	self.hold_search_cabinet_a.icon = "interaction_search"
	self.hold_search_steel_cabinet.icon = "interaction_search"
	self.hold_search_bookshelf.icon = "interaction_search"
	self.hold_search_drawer.icon = "interaction_search"
	self.hold_search_drawers.icon = "interaction_search"
	self.hold_search_shower.icon = "interaction_search"
	self.hold_search_luggage.icon = "interaction_search"
	self.hold_search_flightcase.icon = "interaction_search"
	self.hold_search_fridge.icon = "interaction_search"
	self.hold_search_display_case.icon = "interaction_search"
	self.hold_search_washer.icon = "interaction_search"
	self.hold_type_in_password.icon = "laptop_objective"
	self.hold_hack_server_room.icon = "laptop_objective"
	self.hold_turn_off.icon = "interaction_valve"
	self.press_play_jacket_sound.icon = "interaction_play_pause"
	self.hold_move_car_spa.icon = "interaction_steering_wheel"
	self.pry_open_door_elevator.icon = "equipment_crowbar"
	self.hold_signal_mr_blonde.icon = "interaction_answerphone"
	self.hold_take_diamond_briefcase.icon = "equipment_briefcase"
	self.press_hand_over_diamond_briefcase.icon = "equipment_briefcase"
	self.press_pour_liquid_nitrogen.icon = "equipment_thermite"
	self.press_take_liquid_nitrogen.icon = "equipment_thermite"
	self.hold_place_liquid_nitrogen.icon = "equipment_thermite"
	self.hold_remove_liquid_nitrogen.icon = "equipment_thermite"
	self.hold_cut_wires.icon = "interaction_wirecutter"
	self.hold_rvd_open_vault.icon = "interaction_open_door"
	self.invisible_interaction_open_axis_rvd.icon = "interaction_open_door"
	self.press_take_folder.icon = "interaction_files"
	self.hold_take_old_wine.icon = "equipment_bottle"
	self.take_jfr_briefcase.icon = "equipment_briefcase"
	self.hold_take_missing_animal_poster.icon = "equipment_files"
	self.hold_pick_up_turtle.icon = "equipment_turtle"
	self.hold_help_turtle.icon = "equipment_turtle"
	self.hold_generator_start.icon = "interaction_press_button"
	self.hold_remove_rope.icon = "equipment_winch_hook"
	self.hold_move_gangplank.icon = "equipment_planks"
	self.hold_wwh_untie.icon = "interaction_free"
	self.connect_hose_wwh.icon = "cable"
	self.connect_hose_ship_wwh.icon = "cable"
	self.connect_hose_pump_wwh.icon = "cable"
	self.detach_hose_wwh.icon = "cable"
	self.open_lid_wwh.icon = "cable"
	self.take_confidential_folder_icc.icon = "interaction_files"
	self.hack_dah_jammed_x.icon = "repair"
	self.diamond_pickup_3sec.icon = "interaction_diamond"
	self.diamonds_pickup.icon = "interaction_diamond"
	self.diamonds_pickup_full.icon = "interaction_diamond"
	self.red_diamond_pickup.icon = "interaction_diamond"
	self.red_diamond_pickup_no_axis.icon = "interaction_diamond"
	self.dah_panicroom_keycard.icon = "equipment_bank_manager_key"
	self.diamond_pickup_axis.icon = "interaction_diamond"
	self.hold_to_choose_mask.icon = "equipment_chrome_mask"
	self.hold_take_mask_axis.icon = "equipment_chrome_mask"
	self.hold_search_toilet.icon = "interaction_search"
	self.hold_search_dumpster.icon = "interaction_search"
	self.hold_cut_tarp.icon = "interaction_scissors"
	self.hold_new_hack.icon = "laptop_objective"
	self.hold_take_medallion.icon = "equipment_medallion"
	self.apply_thermite_paste_no_consume.icon = "equipment_thermite"
	self.brb_connect_winch_hook.icon = "equipment_winch_hook"
	self.press_insert_sample.icon = "equipment_vial"
	self.press_take_sample.icon = "equipment_vial"
	self.press_touch_book.icon = "equipment_hand"
	self.hold_take_sample.icon = "equipment_vial"
	self.hold_take_sample_valid.icon = "equipment_vialOK"
	self.hold_stash_vial.icon = "equipment_vialOK"
	self.press_call_elevator.icon = "interaction_elevator"
	self.hold_check_file.icon = "interaction_patientfile"
	self.breach_crowbar.icon = "equipment_crowbar"
	self.hold_place_sentry.icon = "interaction_sentrygun"
	self.tag_laptop.icon = "laptop_objective"
	self.hold_new_hack_tag.icon = "laptop_objective"
	self.tag_take_unknown.icon = "equipment_evidence"
	self.press_take_chimichanga.icon = "equipment_chimichanga"
	self.press_place_chimichanga.icon = "equipment_chimichanga"
	self.hacking_barrier.icon = "equipment_hack_ipad"
	self.hold_disable_alarm.icon = "equipment_hack_ipad"
	self.hold_open_the_safe.icon = "equipment_safe"
	self.hold_turn_off_light.icon = "interaction_powerbox"
	self.hold_relay_locke.icon = "interaction_answerphone"
	self.press_knock_on_door.icon = "interaction_knock"
	self.press_take_elevator.icon = "interaction_elevator"
	self.tag_take_stapler.icon = "equipment_stapler"
	self.press_place_stapler.icon = "equipment_stapler"
	self.push_button_secret.icon = "interaction_press_button"
	self.hold_charge_gun.icon = "laptop_objective"
	self.hold_mix_concoction.icon = "equipment_compoundok"
	self.hold_take_concoction.icon = "equipment_compoundok"
	self.apply_concoction_paste.icon = "equipment_compoundok"
	self.push_button_des.icon = "interaction_press_button"
	self.hold_push_button.icon = "interaction_press_button"
	self.hold_move_crane.icon = "interaction_press_button"
	self.hold_search_documents.icon = "interaction_search"
	self.des_take_unknown.icon = "equipment_evidence"
	self.hold_add_compound_a.icon = "equipment_compounda"
	self.hold_add_compound_b.icon = "equipment_compoundb"
	self.hold_add_compound_c.icon = "equipment_compoundc"
	self.hold_add_compound_d.icon = "equipment_compoundd"
	self.hold_take_compound_a.icon = "equipment_compounda"
	self.hold_take_compound_b.icon = "equipment_compoundb"
	self.hold_take_compound_c.icon = "equipment_compoundc"
	self.hold_take_compound_d.icon = "equipment_compoundd"
	self.hold_take_battery.icon = "equipment_battery"
	self.hold_remove_battery.icon = "equipment_battery"
	self.hold_aim_laser.icon = "agressor"
	self.hold_fire_laser.icon = "agressor"
	self.press_pay_respects.icon = "interaction_pray"
	self.hold_place_device.icon = "equipment_hack_ipad"
	self.hold_take_tablet.icon = "equipment_obsidian_plate"
	self.hold_take_wrench.icon = "equipment_drillfix"
	self.invisible_interaction_open_axis_sah.icon = "equipment_hack_ipad"
	self.hold_extend_bridge.icon = "interaction_press_button"
	self.hold_pull_switch_distance.icon = "interaction_powerbox"
	self.take_pardons.icon = "equipment_presidential_pardon"
	self.vit_take_usb_key.icon = "equipment_usb_no_data"
	self.vit_search.icon = "interaction_search"
	self.vit_search_clues.icon = "laptop_objective"
	self.vit_remove_painting.icon = "equipment_painting"
	self.vit_insert_usb.icon = "equipment_usb_no_data"
	self.gen_pku_thermite_timer_3sec.icon = "equipment_thermite"
	self.vit_keycard_use.icon = "equipment_bank_manager_key"
	self.start_hacking.icon = "interaction_keyboard"
	self.start_hacking_axis.icon = "interaction_keyboard"
	self.postpone_update.icon = "interaction_keyboard"
	self.reboot_computer.icon = "repair"
	self.bypass_the_firewall.icon = "interaction_keyboard"
	self.uno_use_device.icon = "equipment_obsidian_plate"
	self.uno_assemble_device.icon = "equipment_obsidian_plate"
	self.uno_pull_lever.icon = "interaction_pull_lever"
	self.uno_open_door.icon = "interaction_open_door"
	self.uno_hold_pku_gold.icon = "interaction_gold"
	self.uno_hold_pku_gold_bar.icon = "interaction_gold"
	self.uno_press_activate.icon = "interaction_press_button"
	self.uno_mayan_gold_bar.icon = "interaction_gold"
	self.hold_remove_parts.icon = "repair"
	self.press_use_medallion.icon = "equipment_medallion"
	self.hold_choose_hand_left.icon = "equipment_hand"
	self.hold_choose_hand_right.icon = "equipment_hand"
	self.hold_search_fridge_des.icon = "interaction_search"
	self.hold_remove_tarp.icon = "develop"
	self.unlock_gate.icon = "laptop_objective"
	self.mex_pickup_meth_bag.icon = "equipment_cocaine"
	self.hold_generator_start_directional.icon = "interaction_press_button"
	self.mex_red_room_key.icon = "equipment_key_chain"
	self.mex_red_door.icon = "equipment_key_chain"
	self.money_wrap_updating_directional.icon = "interaction_money_wrap"
	self.gen_pku_cocaine_directional.icon = "equipment_cocaine"
	self.connect_hose_directional.icon = "cable"
	self.mex_pickup_murky_uniforms.icon = "terrorist_head"
	self.roman_armor.icon = "equipment_roman"
	self.hold_take_vault_blueprint.icon = "equipment_blueprint"
	self.connect_hose_wwh_short_distance.icon = "cable"
	self.detach_hose_wwh_short_distance.icon = "cable"
	self.mex_gasoline.icon = "equipment_gasoline"
	self.connect_hose_mex.icon = "cable" 
	self.security_cable_grey.icon = "interaction_wirecutter"
	self.bex_take_cup.icon = "interaction_cup"
	self.bex_take_cupprint.icon = "interaction_cup"
	self.bex_activate_flare.icon = "agressor"
	self.bex_restore_power.icon = "interaction_powerbox"
	self.bex_open_window.icon = "interaction_open_door"
	self.thermite_directional.icon = "equipment_thermite"
	self.apply_thermite_paste_directional.icon = "equipment_thermite"
	self.mex_red_room_key_directional.icon = "equipment_key_chain"
	self.take_tape.icon = "equipment_tape"
	self.bex_take_record_tape.icon = "equipment_record_tape"
	self.bex_open_safe.icon = "equipment_safe"
	self.bex_prop_faberge_egg.icon = "equipment_feberge_egg"
	self.bex_pku_treasure.icon = "equipment_money_bag"
	self.bex_safe_door.icon = "equipment_key_chain"
	self.pex_pick_lock_easy_no_skill.icon = "locked"
	self.pex_red_room_key.icon = "equipment_key_chain"
	self.pickup_police_uniform.icon = "equipment_policebadge"
	self.pickup_evidence_pex.icon = "equipment_evidence"
	self.destroy_evidence_pex.icon = "interaction_destroy_evidence"
	self.pickup_wanker_key.icon = "equipment_chavez_key"
	self.pex_pickup_cutter.icon = "equipment_boltcutter"
	self.pex_destroy_evidence_directional.icon = "interaction_destroy_evidence"
	self.pex_destroy_evidence_directional_shredder.icon = "interaction_destroy_evidence"
	self.pex_place_evidance.icon = "equipment_evidence"
	self.pex_pour_liquid_on_evidance.icon = "equipment_thermite"
	self.pex_start_fire.icon = "agressor"
	self.pex_cut_open_chains.icon = "equipment_boltcutter"
	self.pex_armory_hack.icon = "equipment_hack_ipad"
	self.pex_armory_rfid.icon = "equipment_rfid_tag_01"
	self.hand_over_uniform.icon = "equipment_policebadge"
	self.pex_placment_breacher.icon = "equipment_drillfix"
	self.pex_evidance_rfid.icon = "equipment_rfid_tag_02"
	self.pex_restart_start_fire.icon = "agressor"
	self.pex_hook_car.icon = "equipment_winch_hook"
	self.pex_open_door_one.icon = "interaction_open_door"
	self.pex_open_door_one_directional.icon = "interaction_open_door"
	self.pex_medal.icon = "equipment_medal"
	self.pex_flammable_liquid.icon = "equipment_thermite"
	self.ammo_bag_axis.icon = "equipment_ammo_bag"
	self.pex_get_unloaded_card.icon = "equipment_rfid_tag_02"
	self.pex_get_loaded_card.icon = "equipment_rfid_tag_02"
	self.pex_find_a_tag.icon = "equipment_rfid_tag_02"
	self.pex_use_a_tag.icon = "equipment_rfid_tag_02"
	self.pex_use_a_tag_lvl_2.icon = "equipment_rfid_tag_01"
	self.pex_get_loaded_card_lvl_2.icon = "equipment_rfid_tag_01"
	self.pex_set_burnable_liquid.icon = "equipment_thermite"
	self.pex_burn.icon = "agressor"
	self.pex_load_armory_accses.icon = "interaction_powerbox"
	self.pex_door_hydraulic_opener.icon = "equipment_drillfix"
	self.pex_give_car_key.icon ="equipment_chavez_key"
	self.hold_turn_off_sprinklers.icon = "interaction_valve"
	self.fex_take_scythe.icon = "equipment_scythe"
	self.fex_take_scythe_no_axis.icon = "equipment_scythe"
	self.fex_place_wire.icon = "equipment_electrical"
	self.fex_take_wire.icon = "equipment_electrical"
	self.fex_take_wire_axis.icon = "equipment_electrical"
	self.fex_take_globe.icon = "equipment_globe"
	self.fex_take_globe_axis.icon = "equipment_globe"
	self.fex_take_alarm_clock.icon = "equipment_timer"
	self.fex_take_alarm_clock_axis.icon = "equipment_timer"
	self.fex_take_fertilizer.icon = "equipment_fertilizer"
	self.fex_take_fertilizer_axis.icon = "equipment_fertilizer"
	self.fex_take_diesel.icon = "equipment_gasoline"
	self.fex_take_diesel_axis.icon = "equipment_gasoline"
	self.fex_place_scythe.icon = "equipment_scythe"
	self.fex_place_globe.icon = "equipment_globe"
	self.fex_place_alarm_clock.icon = "equipment_timer"
	self.fex_place_fertilizer.icon = "equipment_fertilizer"
	self.fex_place_diesel.icon = "equipment_gasoline"
	self.fex_hold_assemble_bomb.icon = "equipment_c4"
	self.fex_hold_restart_timer.icon = "interaction_restart_timer" 
	self.fex_hold_search_for_clue.icon = "interaction_search"
	self.fex_hold_center_symbol.icon = "develop"
	self.fex_press_frog_symbol.icon = "interaction_press_frog_symbol"
	self.fex_hold_accessing_mask_list.icon = "interaction_keyboard"
	self.fex_hold_prop_wall_lamp.icon = "interaction_hold_prop_wall_lamp"
	self.fex_press_ant_symbol.icon = "interaction_press_ant_symbol"
	self.fex_press_bat_symbol.icon = "interaction_press_bat_symbol"
	self.fex_press_boar_symbol.icon = "interaction_press_boar_symbol"
	self.fex_press_bunny_symbol.icon = "interaction_press_bunny_symbol"
	self.fex_press_butterfly_symbol.icon = "interaction_press_butterfly_symbol"
	self.fex_press_crab_symbol.icon = "interaction_press_crab_symbol"
	self.fex_press_crocodile_symbol.icon = "interaction_press_crocodile_symbol"
	self.fex_press_dog_symbol.icon = "interaction_press_dog_symbol"
	self.fex_press_fish_symbol.icon = "interaction_press_fish_symbol"
	self.fex_press_jaguar_symbol.icon = "interaction_press_jaguar_symbol"
	self.fex_press_lizard_symbol.icon = "interaction_press_lizard_symbol"
	self.fex_press_millipede_symbol.icon = "interaction_press_millipede_symbol"
	self.fex_press_monkey_symbol.icon = "interaction_press_monkey_symbol"
	self.fex_press_owl_symbol.icon = "interaction_press_owl_symbol"
	self.fex_press_snail_symbol.icon = "interaction_press_snail_symbol"
	self.fex_press_snake_symbol.icon = "interaction_press_snake_symbol"
	self.fex_press_spider_symbol.icon = "interaction_press_spider_symbol"
	self.fex_press_squirrel_symbol.icon = "interaction_press_squirrel_symbol"
	self.fex_press_turtle_symbol.icon = "interaction_press_turtle_symbol"
	self.hold_interact_inspect_bookshelf.icon = "interaction_search"
	self.fex_hold_mark_clues.icon = "interaction_mark_clues"
	self.fex_place_gasoline.icon = "equipment_gasoline"
	self.fex_place_gas_can.icon = "equipment_gasoline"
	self.fex_pick_lock_easy_no_skill.icon = "locked"
	self.fex_take_churros.icon = "interaction_take_churros" 
	self.fex_pickup_harddrive.icon = "equipment_harddrive"
	self.pickup_keycard_axis.icon = "equipment_bank_manager_key"
	self.chas_search_code.icon = "interaction_search"
	self.hold_unlock_forklift.icon = "equipment_chavez_key"
	self.chas_light_switch.icon = "interaction_press_button"
	self.chas_light_switch_off.icon = "interaction_press_button"
	self.chas_prop_hack_box.icon = "equipment_hack_ipad"
	self.chas_pickup_keychain_forklift.icon = "equipment_key_chain"
	self.chas_breach_shutter.icon = "interaction_press_button"
	self.chas_pku_dragon_statue.icon = "equipment_dragon_statue" 
	self.chas_tea_set.icon = "equipment_tea_set" 
	self.c4_stackable.icon = "equipment_c4"
	self.money_wrap_single_chas.icon = "equipment_hack_ipad"
	self.chas_pick_lock_easy_no_skill.icon = "locked"
	self.xm20_int_mask.icon = "equipment_chrome_mask"
	self.sand_release_vlad.icon = "interaction_free"
	self.sand_open_first_aid_kit.icon = "interaction_open_door"
	self.sand_take_adrenaline.icon = "equipment_syringe"
	self.sand_use_adrenaline.icon = "equipment_syringe"
	self.sand_move_truck.icon = "interaction_steering_wheel"
	self.sand_open_warehouse_door.icon = "equipment_hand"
	self.sand_open_slide_gate.icon = "interaction_push"
	self.sand_search_for_documents.icon = "equipment_files"
	self.sand_take_usb.icon = "equipment_usb_no_data"
	self.sand_insert_usb.icon = "equipment_usb_no_data"
	self.sand_place_documents.icon = "equipment_files"
	self.sand_take_laxative.icon = "equipment_cleaning_product"
	self.sand_spike_cake.icon = "equipment_cleaning_product"
	self.sand_take_gas_canister.icon = "equipment_gasoline"
	self.sand_place_gas_canister.icon = "equipment_gasoline"
	self.sand_charge_paddles.icon = "equipment_defibrillator"
	self.sand_take_paddles.icon = "equipment_defibrillator"
	self.sand_place_paddles.icon = "equipment_defibrillator"
	self.sand_use_paddles.icon = "equipment_defibrillator" 
	self.sand_start_defibrillator.icon = "equipment_defibrillator"
	self.sand_slide_ramp.icon = "interaction_push"
	self.sand_take_note.icon = "equipment_notepad"
	self.sand_place_note.icon = "equipment_notepad"
	self.sand_open_handcuffs.icon = "interaction_free"
	self.sand_button_number_sign.icon = "interaction_press_button"
	self.sand_hit_gong.icon = "interaction_knock"
	self.fake_pick_lock_easy_no_skill.icon = "locked"
	self.sand_hold_blow_torch.icon = "equipment_blow_torch"
	self.sand_ring_bell.icon = "interaction_knock"
	self.sand_move_cargo.icon = "interaction_press_button"
	self.sand_help_vlad.icon = "interaction_help"
	self.sand_open_truck_door.icon = "interaction_open_door"
	self.sand_close_truck_door.icon = "interaction_open_door"
	self.sand_raise_ramp.icon = "interaction_press_button"
	self.sand_torture_tape.icon = "equipment_record_tape"
	self.sand_pickup_harddrive.icon = "equipment_harddrive"
	self.sand_hold_move_truck.icon = "interaction_steering_wheel"
	self.sand_tort_tape.icon = "equipment_record_tape"
	self.sand_ipad.icon = "equipment_hack_ipad"
	self.chca_flip_table.icon = "interaction_table"
	self.chca_force_open_vent.icon = "interaction_wirecutter"
	self.chca_hold_open_safe.icon = "equipment_key_chain"
	self.chca_hold_use_handprint.icon = "equipment_hand"
	self.chca_hold_pour_diesel.icon = "equipment_gasoline"
	self.chca_connect_winch_hook.icon = "equipment_winch_hook"
	self.chca_hold_disable_firewall.icon = "interaction_keyboard"
	self.chca_hold_lower_lifeboat.icon = "interaction_valve"
	self.chca_hold_take_business_card.icon = "equipment_businesscard" 
	self.chca_hold_lower_big_painting.icon = "equipment_painting"
	self.chca_hold_open_round_window.icon = "interaction_open_door"
	self.chca_hold_passenger_manifest.icon = "interaction_keyboard"
	self.apply_thermite_paste_chca.icon = "equipment_thermite"
	self.chca_hold_ink_money.icon = "equipment_printer_ink"
	self.chca_hold_burn_money.icon = "agressor"
	self.chca_start_hacking.icon = "interaction_keyboard"
	self.chca_remove_hatch.icon = "interaction_open_door"
	self.chca_place_bug.icon = "equipment_audio_device"
	self.chca_keycard.icon = "equipment_bank_manager_key"
	self.hold_take_hand.icon = "equipment_hand"
	self.pick_up_item.icon = "interaction_pickup_extra"
	self.pent_hold_start_brew.icon = "interaction_press_button"
	self.pent_press_signal_operator.icon = "interaction_hold_prop_wall_lamp"
	self.pent_press_place_intel.icon = "equipment_notepad"
	self.pent_hold_start_fire_alarm.icon = "interaction_press_button"
	self.pent_hold_remove_elevator_hatch.icon = "equipment_crowbar"
	self.pent_hold_connect_wire_to_door.icon = "equipment_cargo_strap"
	self.pent_hold_connect_wire_to_elevator.icon = "equipment_cargo_strap"
	self.pent_hold_move_cover.icon = "develop"
	self.pent_glass_cutting.icon = "equipment_glasscutter"
	self.pent_motor_start.icon = "interaction_press_button"
	self.pent_hold_repair_cable.icon = "interaction_wirecutter"
	self.pick_lock_easy_no_skill_pent.icon = "locked"
	self.pent_pull_lever.icon = "interaction_pull_lever"
	self.pent_press_take_car_jack.icon = "equipment_car_jack"
	self.pent_press_take_gas_can.icon = "equipment_gasoline"
	self.pent_press_car_platform.icon = "interaction_press_button"
	self.pent_hold_lift_car.icon = "equipment_car_jack"
	self.pent_press_release_jack.icon = "equipment_car_jack"
	self.pent_reboot_generator.icon = "repair"
	self.pent_take_wire.icon = "equipment_cargo_strap"
	self.pent_refuel_car.icon = "equipment_gasoline"
	self.pent_window_cutting.icon = "equipment_glasscutter"
	self.pent_gnome_carry.icon = "equipment_gnome"
	self.pent_open_trunk.icon = "interaction_open_door"
	self.pent_press_call_elevator.icon = "interaction_elevator"
	self.pent_generator_start.icon = "interaction_press_button"
	self.pent_open_powerbox.icon = "interaction_wirecutter"
	self.pent_kitchen_elevator.icon = "interaction_elevator"
	self.hold_take_mask_pent.icon = "equipment_chrome_mask"
	self.pent_pick_lock.icon = "locked"
	self.pent_hold_close.icon = "interaction_open_door"
	self.pent_hold_open.icon = "interaction_open_door"
	self.ranc_hold_release_brake.icon = "interaction_pull_lever"
	self.ranc_hold_push_truck.icon = "interaction_push"
	self.ranc_hold_take_winchhook.icon = "equipment_winch_hook" 
	self.ranc_hold_attach_winchhook.icon = "equipment_winch_hook"
	self.ranc_hold_start_truck.icon = "interaction_steering_wheel" 
	self.ranc_press_take_laptop.icon = "laptop_objective" 
	self.ranc_press_place_laptop.icon = "laptop_objective"
	self.ranc_hold_take_barrel.icon = "equipment_barrel"
	self.ranc_hold_place_barrel.icon = "equipment_barrel"
	self.ranc_hold_take_receiver.icon = "equipment_receiver" 
	self.ranc_hold_place_receiver.icon = "equipment_receiver" 
	self.ranc_hold_take_stock.icon = "equipment_stock" 
	self.ranc_hold_take_bugging_device.icon = "equipment_audio_device" 
	self.ranc_hold_place_stock.icon = "equipment_stock"  
	self.ranc_hold_construct_weapon.icon = "equipment_drillfix" 
	self.ranc_hold_pour_acid.icon = "equipment_acid" 
	self.ranc_hold_move_plank.icon = "equipment_planks" 
	self.ranc_press_log_into_laptop.icon = "laptop_objective"  
	self.ranc_hold_plant_bugging_device.icon = "equipment_audio_device"  
	self.ranc_hold_adjust_temperature.icon = "interaction_press_button" 
	self.ranc_press_turn_off_radio.icon = "interaction_press_button" 
	self.ranc_press_turn_on_firepit.icon = "agressor" 
	self.ranc_press_reset_generator.icon = "interaction_press_button"  
	self.ranc_press_wake_computer.icon = "laptop_objective" 
	self.ranc_turret_part_carry.icon  = "equipment_money_bag" 
	self.ranc_take_acid.icon = "equipment_acid"  
	self.ranc_take_sheriff_star.icon = "equipment_sheriff_star"
	self.ranc_take_hammer.icon = "equipment_hammer"
	self.ranc_take_silver_ingot.icon = "equipment_silver_ingot"
	self.ranc_take_mould.icon = "equipment_mould"
	self.ranc_break_wall.icon  = "equipment_crowbar" 
	self.ranc_hold_craft_sheriff_star.icon = "equipment_sheriff_star" 
	self.ranc_hold_assemble_turret.icon = "equipment_drillfix"
	self.ranc_hold_disassemble_turret.icon = "equipment_drillfix" 
	self.ranc_hold_enter_turret.icon = "interaction_turret" 
	self.ranc_press_open_door.icon = "interaction_open_door" 
	self.ranc_press_place_hammer.icon = "equipment_hammer" 
	self.ranc_press_place_mould.icon = "equipment_mould" 
	self.ranc_press_pickup_horseshoe.icon = "interaction_horseshoe" 
	self.ranc_take_weapons.icon = "rifle_icon" 
	self.ranc_audio_case.icon = "equipment_briefcase"
	self.pda9_feed_bag.icon = "interaction_money_wrap"
	self.pda9_piggybank_1.icon = "agressor"
	self.pda9_piggybank_2.icon = "agressor"
	self.pda9_piggybank_3.icon = "agressor"
	self.pda9_piggybank_4.icon = "agressor"
	self.trai_printing_plates_carry.icon = "equipment_plates"
	self.trai_fix_cable.icon = "interaction_wirecutter"
	self.trai_achievement_safe.icon = "equipment_sheriff_star"
	self.trai_crane_control.icon = "interaction_press_button"
	self.trai_place_thermite.icon = "equipment_thermite"
	self.trai_connect_locke.icon = "interaction_answerphone"
	self.trai_hold_attach_hook.icon = "equipment_winch_hook"
	self.trai_hold_decouple_locomotive.icon = "interaction_pull_lever"
	self.trai_hold_refuel_locomotive.icon = "cable"
	self.trai_hold_start_locomotive_engine.icon = "interaction_powerbox"
	self.trai_hold_picklock_toolsafe.icon = "locked"
	self.trai_hold_toolsafe_pickuptool.icon = "equipment_drillfix"
	self.trai_press_reinforced_big_sliding_gate_open.icon = "interaction_push"
	self.trai_connect_locke_walkietalkie.icon = "interaction_answerphone"
	self.trai_use_turntable.icon = "interaction_press_button"
	self.trai_hold_access_console.icon = "interaction_press_button"
	self.trai_achievement_container_key.icon = "equipment_generic_key"
	self.trai_achievement_container.icon = "equipment_generic_key"
	self.trai_hold_disable_alarm.icon = "equipment_hack_ipad"
	self.hack_trai_outline.icon = "interaction_keyboard"
	self.trai_open_from_inside_main_wagon.icon = "interaction_open_door"
	self.cg22_spawn_present.icon = "interaction_christmas_present"
	self.cg22_bag_carry_drop.icon = "interaction_christmas_present"
	
--invisible_interaction_open is responsible for opening several containers AND atms at the same time
--the code below changes the icon from default "opening doors" to "money_wrap" on maps with atms
--can't	be done on Hoxout 1 because it also opens that road thing that needs rewiring and you're unlikely to open atms on that map anyway so no biggie
	
local job = Global.level_data and Global.level_data.level_id
local atm_jobs = {
		[ "branchbank" ] = true,
		[ "four_stores" ] = true,
		[ "roberts" ] = true,
		[ "family" ] = true,
		[ "welcome_to_the_jungle_1" ] = true,
		[ "welcome_to_the_jungle_1_night" ] = true,
		[ "mallcrasher" ] = true,
		[ "firestarter_3" ] = true,
		[ "election_day_3" ] = true,
		[ "arena" ] = true
	}

if atm_jobs[ job ] then
		self.invisible_interaction_open.icon = "interaction_money_wrap"
end