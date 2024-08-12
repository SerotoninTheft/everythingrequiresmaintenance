script.on_init(function()
  -- Get the settings from the player
  local damage_interval_ticks = 15000
  local damage_amount = 15

  -- Schedule the event to run based on the configured tick interval
  script.on_nth_tick(damage_interval_ticks, function(event)
    for _, surface in pairs(game.surfaces) do
      for _, entity in pairs(surface.find_entities()) do
        -- Ensure the entity is valid and has health, then check the entity type
        if entity and entity.valid and entity.health and
          not (entity.type == "player" or 
               entity.type == "unit" or 
               entity.type == "unit-spawner" or 
               entity.type == "turret" or 
               entity.type == "tree" or 
               entity.type == "simple-entity") then
          
          if entity.health >= damage_amount + 4 then
            -- Reduce health by the damage amount if health is above the threshold
            entity.health = entity.health - damage_amount
          else
            -- Apply damage if health is below the threshold
            entity.damage(damage_amount, "neutral", "impact")
          end
        end
      end
    end
  end)
end)