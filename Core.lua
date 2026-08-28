PDTHHud.AddonPath = LuaModManager.Constants.mods_directory .. "PDTH Hud/PDTH HUD addons/"
pdth_hud = PDTHHud -- support for mods that use this global.

function PDTHHud:PreInit()
	self.utils = PDTHHudCoreUtils:new(self)
	self.definitions = PDTHHudCoreDefinitions:new(self)
	self.textures = PDTHHudCoreTextures:new(self)
	self.callbacks = PDTHHudCoreCallbacks:new(self)
end

function PDTHHud:Init()
	if not file.DirectoryExists(self.AddonPath) then
        os.execute("mkdir \"" .. self.AddonPath .. "\"")
    end
end

function PDTHHud:InitConstants()
	self.constants = PDTHHudCoreConstants:new(self)
end

function PDTHHud:LoadAddons()
	self.LocalAddonPath = self.ModPath .. "addons/"

    local portraits = {}
	local dirs = {self.AddonPath, self.LocalAddonPath}
	for _, dir in pairs(dirs) do
	    local addons = file.GetFiles(dir)
		if addons then
		    for _, path in pairs(addons) do
		        if string.ends(path, "json") then
		            local file = io.open(Path:Combine(dir, path), "r")
		            local file_contents = file:read("*all")
	                file:close()
		            local data = json.decode( file_contents )
		            self.textures:ProcessAddon(data, portraits)
		        end
		    end
		end
	end

    local portrait_tbl = {}

    for i, char in pairs(tweak_data.criminals.characters) do
        portrait_tbl[char.name] = { name = char.name, title_id = "menu_" .. char.name, default_value = 1, values = {}, hidden = true }
	end
    for _, portrait in pairs(portraits) do
        for _, char in pairs(portrait.characters) do
            if portrait_tbl[char] then
                table.insert(portrait_tbl[char].values, portrait.name)
            end
        end
    end

    return portrait_tbl
end

local level_blacklist = {
	"mia2_new",
	"driving_escapes_industry_day",
	"driving_escapes_city_day"
}

function PDTHHud:GetLevels()
	local level_tbl = {}
	for _, level in pairs(tweak_data.levels._level_index) do
		if tweak_data.levels[level] ~= nil and not table.contains(level_blacklist, level) then
			local suffix = ""
            if string.ends(level, "_night") then
                suffix = " Night"
            end
            if string.ends(level, "_day") then
                suffix = " Day"
            end

			local is_current_level = not Global.load_start_menu and Global.game_settings and level == Global.game_settings.level_id
			table.insert(level_tbl, {
				name = level,
				title_id = function() return managers.localization:exists(tweak_data.levels[level].name_id) and managers.localization:text(tweak_data.levels[level].name_id) .. suffix or level end,
				default_value = 2,
				merge_data = is_current_level and {
					row_item_color = Color.yellow,
                    hightlight_color = Color.yellow,
				} or nil
			})
		end
	end

	return level_tbl
end