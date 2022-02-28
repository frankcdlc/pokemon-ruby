class Battle
  # (complete parameters)
  attr_reader :player, :bot, :player_p, :bot_p, :trainer_name
  
  def initialize(player, bot)
    # Complete this
    @player = player
    @bot = bot
    @player_p = @player.pokemon
    @bot_p = @bot.pokemon
  end

  def start
    # Prepare the Battle (print messages and prepare pokemons)
    if trainer_name = "Brook"
      puts "#{bot_p.species}"
    puts ""
    puts "Brook sent out #{bot_p.species.upcase}!"
    puts "#{player.name} sent out #{player_p.name.upcase}!"
    puts "-------------------Battle Start!-------------------"
    puts ""
    player_p.prepare_for_battle
    bot_p.prepare_for_battle
    elsif trainer_name = "Random Name"
      puts ""
      puts "Random Name sent out #{bot_p.species.upcase}!"
      puts "#{player.name} sent out #{player_p.name.upcase}!"
      puts "-------------------Battle Start!-------------------"
      puts ""
      player_p.prepare_for_battle
      bot_p.prepare_for_battle
    end
    
    # Until one pokemon faints
    until @player_p.fainted? || @bot_p.fainted?
      # --Print Battle Status
      puts "#{player.name}'s #{player_p.name} - Level #{player_p.level}"
      puts "HP: #{player_p.current_hp}"
      puts "#{trainer_name}'s #{bot_p.species.upcase} - Level #{bot_p.level}"
      puts "HP: #{bot_p.current_hp}"
      puts ""

      # --Both players select their moves
      puts "#{player.name}, select your move:"
      puts ""
      puts "1. #{player_p.moves[0]}      2. #{player_p.moves[1]}"
      print "> "
      player.select_move
      bot.select_move

      # --Calculate which go first and which second
      first = first_attacker(player_p, bot_p)
      second = first == player_p ? bot_p : player_p

      # --First attack second
      puts "--------------------------------------------------"
      puts "#{first.name} used #{first.current_move[:name].upcase}!"
      damage = first.attack(second)
      second.receive_damage(damage)
      
      # --If second not fainted, second attack first
      unless second.fainted?
        puts "--------------------------------------------------"
        puts "#{second.name} used #{second.current_move[:name].upcase}!"
        damage = second.attack(first)
        first.receive_damage(damage)
        puts "--------------------------------------------------"
        # --If first is fainted, print fainted message
        puts "#{first.name} FAINTED!" if first.fainted?
      else
        # --If second is fainted, print fainted message
        puts "--------------------------------------------------"
        puts "#{second.name} FAINTED!"
      end
    end
    # Check which player won and print messages
    winner = player_p.fainted? ? bot_p : player_p
    losser = winner == player_p ? bot_p : player_p
    puts "--------------------------------------------------"
    puts "#{winner.name} WINS!"

    # If the winner is the Player increase pokemon stats
    if winner == player_p
      player_p.increase_stats(bot_p)
      puts "-------------------Battle Ended!-------------------"
      if trainer_name = "Brook"
      puts "Congratulation! You have won the game!"
      puts "You can continue training your Pokemon if you want"
      end
    end
    
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
