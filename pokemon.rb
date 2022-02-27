# require neccesary files
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"

class Pokemon
  # include neccesary modules
  attr_reader :name, :species, :type, :level, :base_exp, :effort_points,:growth_rate, :base_stats, :moves, :stat_individual, :stat1, :stat_effort, :stat2, :current_move, :current_hp, :experience_points

  attr_writer :current_move, :current_hp

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
    @current_hp = nil
  end

  def prepare_for_battle
    # Complete this
    @current_move = nil
    @current_hp = @stat2[:hp]
  end

  def receive_damage(damage)
    # Complete this
    @current_hp -= damage 
  end

  def set_current_move
    # Complete this
  end

  def fainted?
    # Complete this
    !@current_hp.positive?
  end

  def attack(target)
    # Print attack message 'Tortuguita used MOVE!'
    # Accuracy check
    damage = 0
    accuracy = true
    accuracy = false if current_move[:accuracy] < rand(1..100)
    
    # If the movement is not missed
    if accuracy
      # -- Calculate base damage
      damage = calculate_base_damage(target)
    
      # -- Critical Hit check
      hit_critcal = 16 == rand(1..16) ? 1.5 : 1
      # -- If critical, multiply base damage and print message 'It was CRITICAL hit!'
      if hit_critcal == 1.5
        puts "It was CRITICAL hit!" 
        damage *= 1.5
      end

      # -- Effectiveness check
      v_effectiveness = effectiveness(target)

      # -- Mutltiply damage by effectiveness multiplier and round down. Print message if neccesary
      damage *=v_effectiveness
      message_effectiveness(v_effectiveness)
      
      # -- Inflict damage to target and print message "And it hit [target name] with [damage] damage""
      puts "And it hit #{target.name} with #{damage} damage"
    else
    # Else, print "But it MISSED!"
      puts "But it MISSED!"
    end
    damage
  end

  def increase_stats(target)
    # Increase stats base on the defeated pokemon and print message "#[pokemon name] gained [amount] experience points"
    @stat2.each do |key, value|
      @stat2[key] += target.effort_points[:amount] if key == target.effort_points[:type]
    end

    @stat_effort.each do |key, value|
      @stat_effort[key] += (base_stats[key] / 4.0).floor
    end

    gained_exp = (target.base_exp * target.level / 7.0).floor
    @experience_points += gained_exp
    puts "#{name} gained #{gained_exp} experience points"
    # If the new experience point are enough to level up, do it and print
    # message "#[pokemon name] reached level [level]!" # -- Re-calculate the stat


  end

  # private methods:
  # Create here auxiliary methods
  def calculate_base_damage(target)
    
    offensive_stat = current_move[:type] == :normal ? stat2[:attack] : stat2[:special_attack]
      
    move_power = current_move[:power]
      
    target_defensive_stat = current_move[:type] == :normal ? target.stat2[:defense] : target.stat2[:special_defense]

    damage = (((2 * level / 5.0 + 2).floor * offensive_stat * move_power / target_defensive_stat).floor / 50.0).floor + 2
    
    damage
  end

  def effectiveness(target)
    multiplier = Pokedex::TYPE_MULTIPLIER
    type_attack = current_move[:type]
    target_type_pokemon = target.type
    multiplier_array = []
    multiplier.each do |hash| 
      multiplier_array.push(hash) if hash[:user] == type_attack
    end
    # p multiplier_array
    mult = 1
    target_type_pokemon.each do |type|
      multiplier_array.each do |hash|
        mult *= hash[:multiplier] if type == hash[:target]
      end
    end
    mult
  end

  def message_effectiveness(v_effectiveness)
    # ---- "It's not very effective..." when effectivenes is less than or equal to 0.5
    if v_effectiveness <= 0.5 && v_effectiveness > 0
      puts "It's not very effective..."
    # ---- "It's super effective!" when effectivenes is greater than or equal to 1.5
    elsif v_effectiveness < 1.5 && v_effectiveness > 0.5
    elsif v_effectiveness >= 1.5
      puts "It's super effective!"
    # ---- "It doesn't affect [target name]!" when effectivenes is 0
    else
      puts "It doesn't affect #{target.name}!"
    end
  end
end

# pokemon = Pokemon.new("Bulb", "Bulbasaur", 1)
# pokemon2 = Pokemon.new("hola", "Charmander", 1)
# puts pokemon.name
# puts pokemon.pokemon
# p pokemon.type[1]
# p pokemon.stat2
# effect = pokemon.effectiveness(pokemon2)
# p effect
# p pokemon.stat2
# pokemon.increase_stats(pokemon2)
# p pokemon.stat2
# p pokemon.stat_effort
# pokemon.increase_stats(pokemon2)
# p pokemon.stat_effort