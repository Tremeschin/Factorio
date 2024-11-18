local shared = require("shared")

-- Dynamically create commands
function add_command(setting)
    commands.add_command(
        shared.to_command_name(setting.name),
        "Set " .. setting.name,
        function(cmd)
            if cmd.parameter then
                shared.update_demolishers(
                    shared.to_property_name(setting.name),
                    tonumber(cmd.parameter)
                )
                game.print("Set " .. setting.name .. " to " .. cmd.parameter)
            end
        end
    )
end

-- Create commands for each setting
script.on_init(function()
    for _, setting in pairs(shared.settings) do
        add_command(setting)
    end
end)
