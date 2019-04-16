require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Welcome screen
puts " -------------------------- "
puts "|  SUPER SMASH BR-OOP       |"
puts "|  MELEE ULTIMATE 64        |"
puts " -------------------------- "

# Initializing User player character
puts 'Please enter your name to begin'
puts username = gets.chomp

my_game = Game.new(username)
while my_game.is_still_ongoing? == true
  my_game.menu
  print '> '
  input = gets.chomp
  my_game.menu_choice(input)
  puts 'Press any key to continue'
  gets.chomp
  my_game.enemies_attack
  puts '                     -----------                     '
  my_game.show_players
  puts '                     -----------                     '
  puts 'Press any key to continue to the next round'
  gets.chomp
end
