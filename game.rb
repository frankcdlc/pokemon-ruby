# require neccesary files
require_relative "player"
require_relative "battle"
# require_relative "get_input"
# require_relative "greeting"

# include Greet
# include GetInput

class Game
  def greeting
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$##$##$##$ ---        Pokemon Ruby         --- #$##$##$#$#"
    puts "#$#$#$#$#$#$#$                               $#$#$#$#$#$#$#"
    puts "#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#"
    puts ""
    puts "Hello there! Welcome to the world of POKEMON! My name is OAK!"
    puts "People call me the POKEMON PROF!"
    puts ""
    puts "This world is inhabited by creatures called POKEMON! For some"
    puts "people, POKEMON are pets. Others use them for fights. Myself..."
    puts "I study POKEMON as a profession."
  end
  
  def set_name(pokemon)
    puts ""
    puts "You selected #{pokemon.upcase}. Great choice!"
    puts "Give your pokemon a name?"
    print "> "
    pokemon_name = gets.chomp
  end

  def select_pokemon(name)
    puts "Right! So your name is #{name.upcase}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, #{name.upcase}! There are POKEMON trainer"
    puts "In my old age, I have ony 3 left, but you can have one! Choose!"
    puts ""
    options = ["Bulbasaur", "Charmander", "Squirtle"]

    select_pokemon = ""
    until options.include?(select_pokemon)
      options.each.with_index {|option, index| print "#{index +1}. #{option}\t"}
      puts ""
      print "> "
      select_pokemon = gets.chomp.downcase.capitalize
    end
    select_pokemon
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

  def start_menu(player)
    puts ""
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
    
    # Then create a Player with that information and store it in @player
    player = Player.new(name, pokemon, pokemon_name)
    
    # Suggested game flow
    start_menu(player)
    action = menu
    until action == "Exit" || action == "4"
      case action
      when "Train","2"
        train(player)
        action = menu
      when "Leader","3"
        challenge_leader(player)
        action = menu
      when "Stats","1"
        show_stats(player)
        action = menu
      end
    end
    goodbye
  end

  def train(player)
    # Complete this
    bot = Bot.new
    bot_p = bot.pokemon
    puts ""
    puts "#{player.name}  challenge Random Person for training"
    puts "#{bot.name} has a #{bot.pokemon.species} level #{bot.pokemon.level}"
    puts "What do you want to do now?"
    puts ""
    puts "1. Fight        2. Leave"
    print "> "
    option = ""
    until option == "Leave" || option == "2"
      option = gets.chomp.downcase.capitalize
      if option == "Fight" || option == "1"
        battle = Battle.new(player, bot)
        battle.start
        break
      end
    end
  end

  def challenge_leader(player)
    # Complete this
     brook = Brook.new
     brook_p = brook.pokemon
     puts ""
     puts "#{player.name} challenge the Gym Leader Brock for a fight"
     puts "#{brook.name} has a #{brook.pokemon.species} level #{brook.pokemon.level}"
    puts "What do you want to do now?"
    puts ""
    puts "1. Fight        2. Leave"
    print "> "
     option = ""
    until option == "Leave" || option == "2"
      option = gets.chomp.downcase.capitalize
       if option == "Fight" || option == "1"
         battle = Battle.new(player, brook)
        battle.start
         break
      end
    end
  end

  def show_stats(player)
    # Complete this
    pok = player.pokemon
    puts ""
    puts "#{player.name}:"
    puts "Kind: #{pok.species}"
    puts "Level: #{pok.level}"
    puts "Type: #{pok.type.join(", ")}"
    puts "Stats:"
    puts "HP: #{pok.stat2[:hp]}"
    puts "Attack: #{pok.stat2[:attack]}"
    puts "Defense: #{pok.stat2[:defense]}"
    puts "Special Attack: #{pok.stat2[:special_attack]}"
    puts "Special Defense: #{pok.stat2[:special_defense]}"
    puts "Speed: #{pok.stat2[:speed]}"
    puts "Experience Points: #{pok.experience_points}"
  end

  def goodbye
    # Complete this
    puts ""
    puts "Thanks for playing Pokemon Ruby"
    puts "This game was created with love by: Team 5"
  end

  def menu
    # Complete this
    option = ""
    until option == "1" || option == "Stats" || option == "2" ||    option == "Train" || option == "3" || option == "Leader" || option == "4" || option == "Exit" 
      puts "-----------------------Menu--------------------------"
      puts ""
      puts "1. Stats\t2. Train\t3. Leader\t4. Exit"
      print "> "
      option = gets.chomp.downcase.capitalize
    end
    option
  end
end

game = Game.new
game.start

