# require neccesary files
# require_relative "get_input"
# require_relative "greeting"

# include Greet
# include GetInput

class Game
  def select_pokemon
    puts "Right! So your name is NOMBRE!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, NOMBRE! There are POKEMON trainer"
    puts "In my old age, I have ony 3 left, but you can have one! Choose!"

    options = ["Bulbasaur", "Charmander", "Squirtle"]

    options.each.with_index {|option, index| print "#{index +1}. #{option}    "}
    puts ""
    select_pokemon = ""
    until options.include?(select_pokemon.capitalize)
    print "> "
    select_pokemon = gets.chomp
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

  def set_name
    puts "You selected CHARMANDER. Great choice!"
    puts "Give your pokemon a name?"
    print "> "
    pokemon_name = gets.chomp
  end

  def start_menu
    puts "GREAT MASTER, raise your young GREAT CHAR by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    puts "-----------------------Menu--------------------------"
    puts ""
    puts "1. Stats\t2. train\t3. Leader\t4. Exit"
    print "> "
    opcion = gets.chomp

  end

  def start
    # Create a welcome method(s) to get the name, pokemon and pokemon_name from the user

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
        show_stats
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

  def show_stats
    # Complete this
  end

  def goodbye
    # Complete this
  end

  def menu
    # Complete this
  end
end

# game = Game.new
# game.start


juego = Game.new
juego.greeting
juego.get_input("First, what's your name?")
pokemon = juego.select_pokemon
pokemon_name = juego.set_name
juego.start_menu
