require "pry"

class Player
    attr_accessor :name, :life_points
    @@players = []


    def initialize (name,life_points)
        @name = name.to_s
        @life_points = life_points.to_i
        @@players << self
    end

    def self.players
        @@players
    end

    def show_state
        puts "#{@name} has #{@life_points} hp"
    end

    def gets_damage(damage_received)
        if damage_received.class != Integer
            puts "please enter an integer"
        else
            damage_received = damage_received.to_i
            @life_points = [@life_points - damage_received, 0].max
        end
        if @life_points <= 0 
            puts "You suck #{@name}, try again buddy"
        end
    end

    def attack (player_to_attack)
        puts "#{self.name} attacks #{player_to_attack.name}"
        
        @damage_given = compute_damage
        puts "deals #{@damage_given} damage"
        player_to_attack.gets_damage(@damage_given)
    end

    def compute_damage
        return rand(1..6)
    end
    #binding.pry
end

class HumanPlayer < Player
    attr_accessor :weapon_level #on ajoute l'attribut pour le niveau de l'arme

    def initialize (name, life_points, weapon_level)
        @life_points = 100
        @weapon_level = weapon_level = 1
        super(name,life_points) #on récupère les attributs de la classe Player
    end

    def show_state
        puts "#{@name} has #{@life_points} hp and a lvl #{@weapon_level} weapon"
    end
    
    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        @new_weapon_level = rand(1..6)
        puts "You just found a weapon lvl #{@new_weapon_level}"

        if @new_weapon_level > @weapon_level
            @weapon_level = @new_weapon_level
            puts "Yay, this one is much better :)"
        elsif @new_weapon_level <= @weapon_level
            puts "Nah, nevermind"
        end
    end

    def search_health_pack
        i = rand(1..6)

        if i == 1 
            puts "Nothing was found, unlucky :("
        elsif i == 5 || i == 4 || i == 3 || i == 2
            @life_points += 50
            puts "You just found a +50 hp booster!"
        else i == 6
            @life_points += 80
            puts "Waow, you just found a +80 hp booster !"
                
        end
        if @life_points > 100 #if pour ne pas dépasser les 100 points de vie
            @life_points = 100
        end
    end


end