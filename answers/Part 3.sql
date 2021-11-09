USE Pokemon;
# What is each pokemon's primary type?
SELECT pokemons.name Pokemon_Name, types.name Primary_Type
FROM pokemons
         JOIN types on pokemons.primary_type = types.id;
# What is Rufflet's secondary type?
SELECT pokemons.name Pokemon_Name, types.name Secondary_Type
FROM pokemons
         JOIN types on pokemons.secondary_type = types.id
WHERE pokemons.name = 'Rufflet';
# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT name as Pokemon_Name
FROM pokemons
         JOIN pokemon_trainer trainer on pokemons.id = trainer.pokemon_id
WHERE trainerID = 303;
# How many pokemon have a secondary type `Poison`
SELECT count(name) FROM pokemons p
            JOIN types t on p.secondary_type = t.id
WHERE t.name = 'Poison';
# What are all the primary types and how many pokemon have that type?
SELECT t.name Type_Name, COUNT(t.name) Type_Quantity FROM types t JOIN pokemons p ON p.primary_type =  t.id
GROUP BY t.id ORDER By Type_Quantity DESC;
# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT pt.TrainerID Trainer_ID, count(pt.pokemon_id) Number_Level_100 FROM pokemon_trainer pt
WHERE pt.pokelevel > 99 GROUP BY pt.TrainerID ORDER BY Number_Level_100;
# How many pokemon only belong to one trainer and no other?
SELECT pt.pokemon_id, COUNT(pt.trainerID) Number_of_Trainers
FROM pokemon_trainer pt
GROUP BY pt.pokemon_id HAVING Number_of_Trainers = 1;

