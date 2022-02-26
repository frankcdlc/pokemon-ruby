class Battle
  # (complete parameters)
  attr_reader :player, :bot, :player_p, :bot_p
  
  def initialize(player, bot)
    # Complete this
    @player = player
    @bot = bot
    @player_p = @player.pokemon
    @bot_p = @bot.pokemon
  end

  def start
    # Prepare the Battle (print messages and prepare pokemons)
    puts ""
    puts "Random Person sent out #{bot_p.species.upcase}!"
    puts "#{player.name} sent out #{player_p.name.upcase}!"
    puts "-------------------Battle Start!-------------------"
    puts ""
    player_p.prepare_for_battle
    bot_p.prepare_for_battle
    puts "#{player.name}'s #{player_p.name} - Level #{player_p.level}"
    puts "HP: #{player_p.current_hp}"
    puts "Random Person's #{bot_p.species.upcase} - Level #{bot_p.level}"
    puts "HP: #{bot_p.current_hp}"
    puts ""
    puts "#{player.name}, select your move:"
    puts ""
    puts "1. #{player_p.moves[0]}      2. #{player_p.moves[1]}"
    print "> "
    player.select_move
    bot.select_move
    first = first_attacker(player_p, bot_p)
    second = first == player_p ? bot_p : player_p
    
    
    # Until one pokemon faints

    # --Print Battle Status
    
    # --Both players select their moves

    # --Calculate which go first and which second

    # --First attack second
    puts "--------------------------------------------------"
    puts "#{first.name} used #{first.current_move[:name].upcase}!"
    first.attack(second)
    
    # --If second is fainted, print fainted message
    # --If second not fainted, second attack first
    puts "--------------------------------------------------"
    puts "#{second.name} used #{second.current_move[:name].upcase}!"
    second.attack(first)
    # --If first is fainted, print fainted message

    # Check which player won and print messages
    # If the winner is the Player increase pokemon stats
  end

  def first_attacker(player_p, bot_p)
    player_move = player_p.current_move
		bot_move = bot_p.current_move

		return player_p if player_move[:priority] > bot_move[:priority]
		return bot_p if player_move[:priority] < bot_move[:priority]

		if player_p.stat2[:speed] > bot_p.stat2[:speed]
			player_p
		elsif player_p.stat2[:speed] < bot_p.stat2[:speed]
			bot_p
		else
			[player_p, bot_p].sample
		end
  end
end
