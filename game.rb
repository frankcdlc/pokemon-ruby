# require neccesary files
require_relative "player"
require_relative "battle"
require_relative "get_input"
require_relative "greeting"

class Game
  include Greet
  include GetInput
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
    pokemon_name = choose_name(pokemon)
    # Then create a Player with that information and store it in @player
    player = Player.new(name, pokemon, pokemon_name)
    # Suggested game flow
    start_menu(player)
    action = menu
    until ["Exit", "4"].include?(action)
      case action
      when "Train", "2"
        train(player)
      when "Leader", "3"
        challenge_leader(player)

      when "Stats", "1"
        show_stats(player)
      end
      action = menu
    end
    goodbye
  end

  def train(player)
    # Complete this
    bot = Bot.new
    bot_p = bot.pokemon
    puts ""
    puts "#{player.name}  challenge Random Person for training"
    puts "#{bot.name} has a #{bot_p.species} level #{bot_p.level}"
    puts "What do you want to do now?"
    puts ""
    puts "1. Fight        2. Leave"
    print "> "
    option = ""
    until ["Leave", "2"].include?(option)
      option = gets.chomp.downcase.capitalize
      next unless ["Fight", "1"].include?(option)

      battle = Battle.new(player, bot)
      battle.start
      break
    end
  end

  def challenge_leader(player)
    # Complete this
    brook = Brook.new
    brook_p = brook.pokemon
    puts ""
    puts "#{player.name} challenge the Gym Leader Brock for a fight"
    puts "#{brook.name} has a #{brook_p.species} level #{brook_p.level}"
    puts "What do you want to do now?"
    puts ""
    puts "1. Fight        2. Leave"
    print "> "
    option = ""
    until ["Leave", "2"].include?(option)
      option = gets.chomp.downcase.capitalize
      next unless ["Fight", "1"].include?(option)

      battle = Battle.new(player, brook)
      battle.start
      break
    end
  end

  def show_stats(player)
    # Complete this
    pok = player.pokemon
    puts ""
    puts "#{player.name}:"
    puts "Kind: #{pok.species}"
    puts "Level: #{pok.level}"
    puts "Type: #{pok.type.join(', ')}"
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
    until ["1", "Stats", "2", "Train", "3", "Leader", "4", "Exit"].include?(option)
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
