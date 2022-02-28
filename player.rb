# require neccesary files
require_relative "pokemon"
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"

class Player
  # (Complete parameters)
  attr_reader :name, :pokemon

  def initialize(name, pokemon, pokemon_name = "", level = 1)
    # Complete this
    @name = name
    pokemon_name = pokemon if pokemon_name == ""
    @pokemon = Pokemon.new(pokemon_name, pokemon, level)
  end

  def select_move
    # Complete this
    move = ""
    until pokemon.moves.include?(move)
      puts "#{name}, select your move:"
      puts ""
      puts "1. #{pokemon.moves[0]}      2. #{pokemon.moves[1]}"
      print "> "
      move = gets.chomp
    end
    @pokemon.current_move = Pokedex::MOVES[move]
  end
end

# Create a class Bot that inherits from Player and override the select_move method
class Bot < Player
  attr_reader :random_pokemon

  def initialize
    hash = Pokedex::POKEMONS
    options = hash.collect { |key, _value| key }
    @random_pokemon = options.sample
    super("Random Person", @random_pokemon, "", 1)
  end

  def select_move
    # Complete this
    # hash = Pokedex::MOVES
    # options = hash.collect { |key, value| key }
    options = Pokedex::POKEMONS[pokemon.name][:moves]
    move_random = options.sample
    @pokemon.current_move = Pokedex::MOVES[move_random]
  end
end

class Brook < Player
  attr_reader :pokemon

  def initialize
    # hash = Pokedex::POKEMONS
    pokemon = "Onix"
    # options = hash.collect { |key, value| key }
    # @random_pokemon = options.sample
    super("Brook", pokemon, "", 10)
  end

  def select_move
    options = Pokedex::POKEMONS[pokemon.name][:moves]
    move_random = options.sample
    @pokemon.current_move = Pokedex::MOVES[move_random]
  end
end
# bot = Bot.new
# p bot.pokemon
# bot.select_move
# p bot.pokemon.current_move

# brok = Brook.new
# p brok
