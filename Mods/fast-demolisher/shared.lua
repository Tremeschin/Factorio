local Module = {}

-- Auxiliary functions

function kebab(str)
    return str:lower():gsub(" ", "-")
end

function snake(str)
    return str:lower():gsub(" ", "_")
end

-- Conversion functions

function Module.to_setting_name(name)
    return "fast-demolisher-" .. kebab(name)
end

function Module.to_command_name(name)
    return "demolisher-" .. kebab(name)
end

function Module.to_property_name(name)
    return snake(name)
end

-- Mod settings

Module.settings = {
    {name="Acceleration Rate",      default = 0.05},
    {name="Turn Radius",            default = 5.00},
    {name="Patrolling Speed",       default = 0.30},
    {name="Patrolling Turn Radius", default = 4.00},
    {name="Investigating Speed",    default = 0.50},
    {name="Enraged Speed",          default = 0.65},
}

-- Mod implementation

function Module.update_demolishers(name, value)
    for _, surface in pairs(game.surfaces) do
        for _, demolisher in pairs(surface.find_entities_filtered{type = "unit"}) do
            if demolisher.name == "demolisher" then
                demolisher[name] = value
            end
        end
    end
end

function Module.update_prototypes(demolisher)
    for _, setting in pairs(Module.settings) do
        local property = Module.to_property_name(setting.name)
        local setting  = Module.to_setting_name(setting.name)
        demolisher[property] = settings.startup[setting].value
    end
end

return Module