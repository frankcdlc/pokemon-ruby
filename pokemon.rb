# require neccesary files
require_relative "pokedex/pokemons"

class Pokemon
  # include neccesary modules
  attr_reader :name, :species, :type, :level, :base_exp, :effort_points,:growth_rate, :base_stats, :moves, :stat_individual, :stat1, :stat_effort, :stat2, :current_move

  attr_writer :current_move

  # (complete parameters)
  def initialize(pokemon_name, pokemon, level)
    poke_details = Pokedex::POKEMONS[pokemon]

    @name = pokemon_name
    @species = pokemon
    @type = poke_details[:type]
    @base_exp = poke_details[:base_exp]
    @effort_points = poke_details[:effort_points]
    @growth_rate = poke_details[:growth_rate]
    @base_stats = poke_details[:base_stats]
    @moves = poke_details[:moves]
    @stat_individual = { hp: rand(0..31), attack: rand(0..31), defense: rand(0..31), special_attack: rand(0..31), special_defense: rand(0..31), speed: rand(0..31) }
  
    # Retrieve pokemon info from Pokedex and set instance variables
    # Calculate Individual Values and store them in instance variable
    # Create instance variable with effort values. All set to 0
    @stat_effort = {hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    # Store the level in instance variable
    @level = level
    # If level is 1, set experience points to 0 in instance variable.
    # If level is not 1, calculate the minimum experience point for that level and store it in instance variable.
    @experience_points = 0
    # Calculate pokemon stats and store them in instance variable
    @stat1 = {hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    @stat2 = {}
    @stat1.each do |key,value|
      if key == :hp
        hp = ((2 * base_stats[key] + stat_individual[key] + stat_effort[key]) * level / 100 + level + 10).floor
        @stat2[key] = hp
      else
        stat = ((2 * base_stats[key] + stat_individual[key] + stat_effort[key]) * level / 100 + 5).floor
        @stat2[key] = stat
      end
    end

    @current_move = nil

  end

  def prepare_for_battle
    # Complete this
  end

  def receive_damage
    # Complete this
  end

  def set_current_move
    # Complete this
  end

  def fainted?
    # Complete this
  end

  def attack(target)
    # Print attack message 'Tortuguita used MOVE!'
    # Accuracy check
    # If the movement is not missed
    # -- Calculate base damage
    # -- Critical Hit check
    # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
    # -- Effectiveness check
    # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
    # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
    # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
    # ---- "It doesn't affect [target name]!" when effectivenes is 0
    # -- Inflict damage to target and print message "And it hit [target name] with [damage] damage""
    # Else, print "But it MISSED!"
  end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"

    # If the new experience point are enough to level up, do it and print
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat
  end

  # private methods:
  # Create here auxiliary methods
end

# pokemon = Pokemon.new("hola", "Bulbasaur", 1)
# puts pokemon.name
# puts pokemon.pokemon
# p pokemon.type[1]
# p pokemon.stat2