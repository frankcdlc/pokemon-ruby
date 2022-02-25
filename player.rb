# require neccesary files
require_relative "pokemon"
require_relative "pokedex/pokemons"

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
  end
end

# Create a class Bot that inherits from Player and override the select_move method
class Bot < Player
  attr_reader :random_pokemon

  def initialize
    hash = Pokedex::POKEMONS
    options = hash.collect { |key, value| key }
    @random_pokemon = options.sample
    super("Random Person", @random_pokemon, "", 1)
  end
end

bot = Bot.new
p bot