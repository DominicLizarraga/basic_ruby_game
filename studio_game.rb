
# def hour
#   hour = Time.new.strftime('%T')
# end

# def say_hello(name, health=100)
#   "I'm #{name.capitalize} with a health of #{health}as of #{hour}"
# end

# puts say_hello("larry", 60)
# puts say_hello("curly", 125)
# puts say_hello("moe")
# puts say_hello("shem", 90)
require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'



player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = ClumsyPlayer.new("klutz", 105)
player5 = BerserkPlayer.new("berserker", 50)


knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")
knuckleheads.save_high_scores
knuckleheads.add_player(player4)
knuckleheads.add_player(player5)



loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when "quit", "exit"
    knuckleheads.print_stats
    break
  else
    puts "\n type a number or('quit' to exit)"
  end
end




