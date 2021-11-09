# Directions: Write a query that returns the following collumns:
# The highest combined stats (excluding hp) at level 100 = strongest

select poke.name 'Pokemon Name', t.trainername 'Trainer Name', pt.pokelevel Level,
       prime_type.name 'Primary Type', second_type.name "Secondary Type", pt.attack+pt.defense+pt.defense+pt.spatk+pt.spdef+pt.speed as "Stat Total"
from pokemon_trainer pt JOIN pokemons poke on pt.pokemon_id = poke.id JOIN types second_type on poke.secondary_type = second_type.id
                        JOIN types prime_type on poke.primary_type = prime_type.id JOIN trainers t on pt.trainerID = t.trainerID
ORDER BY pt.pokelevel DESC, pt.attack+pt.defense+pt.defense+pt.spatk+pt.spdef+pt.speed DESC;
