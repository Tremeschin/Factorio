local shared = require("shared")

for _, demolisher in pairs(data.raw["segmented-unit"]) do
    shared.update_prototypes(demolisher)
end
