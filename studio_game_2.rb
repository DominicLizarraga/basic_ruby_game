class Player

  attr_accessor :name, :score
  attr_reader :health

  def initialize(name, health=60)
    @name = name.capitalize
    @health = health
  end

  def score
    @health + @name.length
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00t!"
  end


  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

end

players = %w(Moe Larry Curly)

players[players.length - 1] = "shemp"
puts "There are #{players.size} players in the game:"


players.each do |player|
  p = Player.new(player)
  puts p
  puts p.w00t
  puts p.blam
end

# There are 3 players in the game:
# I'm Moe with a health of 100 and a score of 103.
# I'm Larry with a health of 60 and a score of 65.
# I'm Curly with a health of 125 and a score of 130.














