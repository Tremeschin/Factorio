for _, demolisher in pairs(data.raw["segmented-unit"]) do
    demolisher.acceleration_rate = 0.05
    demolisher.enraged_speed = 60.0
    demolisher.enraged_duration = 1800000
    demolisher.healing_per_tick = 4000
    demolisher.investigating_speed = 20.0
    demolisher.patrolling_speed = 20.0
    demolisher.patrolling_turn_radius = 5
    demolisher.turn_radius = 5
end
