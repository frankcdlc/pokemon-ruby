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
end
# include GetInput
# get_input("Nombre: ")

