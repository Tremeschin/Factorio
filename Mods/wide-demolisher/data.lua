local scale = 1

for name, demolisher in pairs(data.raw["segmented-unit"]) do
    if string.find(name, "demolisher") then
        for _, layer in pairs(demolisher.animation.layers) do
            layer.scale = layer.scale * scale
        end
    end
end

for name, segment in pairs(data.raw["segment"]) do
    if string.find(name, "demolisher") then
        for _, layer in pairs(segment.animation.layers) do
            layer.scale = layer.scale * scale

            for _, value in pairs(layer.shift) do
                value = value * scale
            end
        end
    end
end
