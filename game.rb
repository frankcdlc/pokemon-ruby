# require neccesary files
require_relative "player"
# require_relative "get_input"
# require_relative "greeting"

# include Greet
# include GetInput

class Game
  def select_pokemon(name)
    puts "Right! So your name is #{name.upcase}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, #{name.upcase}! There are POKEMON trainer"
    puts "In my old age, I have ony 3 left, but you can have one! Choose!"

    options = ["Bulbasaur", "Charmander", "Squirtle"]

    options.each.with_index {|option, index| print "#{index +1}. #{option}    "}
    puts ""
    select_pokemon = ""
    until options.include?(select_pokemon)
    print "> "
    select_pokemon = gets.chomp.capitalize
    end
    select_pokemon
  end
  def greeting
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts ""
    puts "Hello there! Welcome to the world of POKEMON! My name is OAK!"
    puts "People call me the POKEMON PROF!"
    puts "This world is inhabited by creatures called POKEMON! For some"
    puts "people, POKEMON are pets. Others use them for fights. Myself..."
    puts "I study POKEMON as a profession."
  end
  def get_input(prompt)
    input = ""
    while input.empty?
      puts prompt
      print "> "
      input = gets.chomp
    end
    input
  end

  def set_name(pokemon)
    puts "You selected #{pokemon.upcase}. Great choice!"
    puts "Give your pokemon a name?"
    print "> "
    pokemon_name = gets.chomp
  end

  def start_menu(player)
    puts "#{player.name.upcase}, raise your young #{player.pokemon.name.upcase} by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    puts 
  end

  def start
    # Create a welcome method(s) to get the name, pokemon and pokemon_name from the user
    greeting
    name = get_input("First, what's your name?")
    pokemon = select_pokemon(name)
    pokemon_name = set_name(pokemon)
    player = Player.new(name,pokemon,pokemon_name)
    start_menu(player)
    # Then create a Player with that information and store it in @player

    # Suggested game flow
    action = menu
    until action == "Exit"
      case action
      when "Train"
        train
        action = menu
      when "Leader"
        challenge_leader
        action = menu
      when "Stats"
        show_stats(player)
        action = menu
      end
    end

    goodbye
  end

  def train
    # Complete this

  end

  def challenge_leader
    # Complete this
  end

  def show_stats(player)
    # Complete this
    pok = player.pokemon
    puts ""
    puts "#{player.name}:"
    puts "Kind: #{pok.pokemon}"
    puts "Level: #{pok.level}"
    puts "Type: #{pok.type.join(", ")}"
    puts "Stats:"
    puts "HP: #{pok.base_stats[:hp]}"
    puts "Attack: #{pok.base_stats[:attack]}"
    puts "Defense: #{pok.base_stats[:defense]}"
    puts "Special Attack: #{pok.base_stats[:special_attack]}"
    puts "Special Defense: #{pok.base_stats[:special_defense]}"
    puts "Speed: #{pok.base_stats[:speed]}"
    puts "Experience Points: #{pok.base_exp}"
  end

  def goodbye
    # Complete this
  end

  def menu
    # Complete this
    puts "-----------------------Menu--------------------------"
    puts ""
    puts "1. Stats\t2. Train\t3. Leader\t4. Exit"
    print "> "
    opcion = gets.chomp.downcase.capitalize
  end
end

# game = Game.new
# game.start


# p player
juego = Game.new
juego.start
