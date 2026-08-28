PDTHHudCoreUtils = PDTHHudCoreUtils or class()

function PDTHHudCoreUtils:GetPortraitColour(health_amount)
    health_amount = health_amount or 1
    local colour = PDTHHud.constants.health_main_colour

    if PDTHHud.Options:GetValue("HUD/portraits/Coloured") then
        if PDTHHud.Options:GetValue("HUD/portraits/GradualColour") then
            if health_amount < PDTHHud.constants.health_gradient_start_point then
                local dmg = PDTHHud.constants.health_main_colour_damaged
                local ratio = 1 - (health_amount / PDTHHud.constants.health_gradient_start_point)
                colour = Color(math.lerp(colour.r, dmg.r, ratio), math.lerp(colour.g, dmg.g, ratio), math.lerp(colour.b, dmg.b, ratio))
            end
        else
            if health_amount <= PDTHHud.constants.health_damage_start_point then
                colour = PDTHHud.constants.health_main_colour_damaged
            end
        end
    else
        colour = Color.white
    end

    return colour
end
