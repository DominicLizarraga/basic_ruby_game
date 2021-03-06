require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'



class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end
  def add_player(a_player)
    @players << a_player
  end

  def print_name_and_health(player)
    puts "#{player.name} #{player.health}"
  end


  def total_points
    @players.reduce(0) { |sum, player| sum + player.points}
  end

  def print_stats
    strong_players = @players.select { |player| player.strong? }
    wimpy_players = @players.reject { |player| player.strong? }
    # strongplayers, wimpy_players = @players.partition { |player| player.strong? }
    puts "\n#{@title} Statistics:"

    puts "#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end

    puts "#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      print_name_and_health(player)
    end

    sorted_players = @players.sort { |a, b| b.score <=> a.score }

    puts "\n #{total_points} total points for treasures found:"
    @players.each do |player|
      puts "\n#{player.name}'s points total:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points."
      end
      puts "\n#{player.points} grand total points."

    end

    puts "\n#{@title} High Scores:"
    sorted_players.each do |player|
      formattted = player.name.ljust(15, ".")
      puts "#{formattted} #{player.score}"
    end
  end

  def save_high_scores(filename="high_scores.txt")
    File.open(filename, "w") do |file|
      file.puts "#{@title} High Scores:"
      @players.each do |player|
        formatted_name = player.name.ljust(19,".")
        file.puts "#{formatted_name} #{player.health}"
      end
    end
  end

  def load_players(file_name)
    File.readlines(file_name).each do |line|
      name, health = line.split(",")
      player = Player.new(name, Integer(health))
      add_player(player)
    end
  end


  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES

    puts "\n There are #{treasures.size} treasures to be found:"
      treasures.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points."
      end

    1.upto(rounds) do |round|
      if block_given?
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end
