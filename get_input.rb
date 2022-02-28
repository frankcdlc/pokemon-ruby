module GetInput
  def get_input(prompt)
    input = ""
    while input.empty?
      puts prompt
      print "> "
      input = gets.chomp
    end
    input
  end

  def select_pokemon
    puts "Right! So your name is #{nombre}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, #{nombre}! There are POKEMON trainer"
    puts "In my old age, I have ony 3 left, but you can have one! Choose!"

    options = ["Bulbasaur", "Charmander", "Squirtle"]

    options.each.with_index { |option, index| print "#{index}. #{option}    " }

    select_pokemon = ""
    select_pokemon = gets.chomp until options.include?(select_pokemon.downcase)
    select_pokemon
  end
end
# include GetInput
# get_input("Nombre: ")
