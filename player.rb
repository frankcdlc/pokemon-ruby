# require neccesary files
require_relative "pokemon"
require_relative "pokedex/pokemons"

class Player
  # (Complete parameters)
  attr_reader :name, :pokemon
  def initialize(name,pokemon,pokemon_name)
    @name = name
    @pokemon = Pokemon.new(pokemon_name, pokemon)

    # Complete this
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
    options = hash.collect do |key, value| 
      key
    end
    @random_pokemon = options.sample

    # super("Random Person",random_pokemon[:species],"")
  end
end

bot = Bot.new
p bot.random_pokemon