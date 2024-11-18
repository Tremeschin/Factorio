local shared = require("shared")

local settings_data = {}

for _, setting in pairs(shared.settings) do
    settings_data[#settings_data + 1] = {
        type = "double-setting",
        name = shared.to_setting_name(setting.name),
        localised_name = setting.name,
        setting_type   = "startup",
        default_value  = setting.default
    }
end

data:extend(settings_data)
