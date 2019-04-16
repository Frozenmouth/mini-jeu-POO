class Game
  attr_accessor :human_player, :enemies

# Initialize method automatically creates 4 enemies player as displayed in the array + 1 playable character for the User.
  def initialize(human_player_username)
    enemies = []
    @enemies = ["Ranged creep", "Siege creep", "Melee creep", "Mega creep"]
    @human_player = HumanPlayer.new(human_player_username)
  end

# Deletes an enemy once it is dead.
  def kill_player(enemy)
  enemies.delete(enemy)
  end

# Method that returns true if the game is still running and false if not.
  def is_still_ongoing?
    if @human_player.life_points <= 0 || enemies.size < 1
      return false
    else
      return true
    end
  end

# Display User player infos + remaining enemies on field
  def show_players
    puts @human_player.show_state
    puts "#{enemies.size} remaining enemies on field"
  end

# Display User choice menu in-between rounds
  def menu
    puts human_player.show_state
    puts 
    puts "Select an action"
    puts
    puts "Level up"
    puts "a - get a better weapon"
    puts "s - heal yourself"
    puts
    puts "hit an enemy on sight :"
    puts " #{player_1.show_state} 0"
    puts " #{player_2.show_state} 1"
  end

  def menu_select(input)
    case input
    when 'a'
      human_player.search_weapon
    when 's'
      human_player.search_health_pack
    when '0'
      human_player.attack(enemies[0])
      kill_player(enemies[0]) if enemies[0].life_points <= 0
    when '1'
      human_player.attack(enemies[1])
      kill_player(enemies[0]) if enemies[1].life_points <= 1
    when '2'
      human_player.attack(enemies[2])
      kill_player(enemies[2]) if enemies[2].life_points <= 2
    when '3'
      human_player.attack(enemies[3])
      kill_player(enemies[3]) if enemies[3].life_points <= 3
    end
  end

  def enemies_attack
    enemies.each do |bagarre|
      bagarre.attack(@human_player)
      puts '----'
    end
  end

  def end
  puts "========> END OF THE GAME <=========="
  puts
    if humanplayer.life_points > 0
      puts "Congrats you won !"
    elsif humanplayer.life_points < 0
      puts "Take this L noob"
    end
  end
end

