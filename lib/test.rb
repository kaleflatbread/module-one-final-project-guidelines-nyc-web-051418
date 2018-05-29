require_relative '../app/models/user.rb'
require_relative 'game_method.rb'

prompt = TTY::Prompt.new
pastel = Pastel.new
font = TTY::Font.new(:starwars)



# App Title
puts pastel.yellow(font.write("Pub Quiz"))

# The user is prompted to enter their username. The database is called to check if the name exists. If it doesn't then a new user is added to the database.
name = prompt.ask('What is your username?')
user = User.name_check(name)
puts "Welcome, #{user.name}!"

initial_menu = prompt.select("What would you like to do?",["Play", "High Scores", "Change Settings"])
  if initial_menu == "Play"
    game_method(user)
  elsif initial_menu == "High Scores"
    Highscore.show_scores
  else
    puts "allow user to change default settings"
  end
