class Player

  attr_accessor :name, :score
  attr_reader :health

  def initialize(name, health=60, score)
    @name = name.capitalize
    @health = health
     @score = score
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



player2 = Player.new("larry", 60)
puts player2.name
player2.name = "Lawrence"
puts player2.name
puts player2.health
puts player2.score
puts player2
