local scale = 4

-- Join the two loops together (raw["segmented-unit"] and raw["segment"])
for entity_type, entities in pairs({
    ["segmented-unit"] = data.raw["segmented-unit"],
    ["segment"] = data.raw["segment"],
}) do
    for name, entity in pairs(entities) do
        if string.find(name, "demolisher") then
            for _, layer in pairs(entity.animation.layers) do
                layer.scale = layer.scale * scale

            end

            for _, box in pairs(entity.collision_box) do
                for i, value in ipairs(box) do
                    box[i] = value * scale
                end
            end
        end
    end
end
