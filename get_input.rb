module GetInput
  def choose_name(pokemon)
    puts ""
    puts "You selected #{pokemon.upcase}. Great choice!"
    puts "Give your pokemon a name?"
    print "> "
    gets.chomp
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
      options.each.with_index { |option, index| print "#{index + 1}. #{option}\t" }
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
end
# include GetInput
# get_input("Nombre: ")
