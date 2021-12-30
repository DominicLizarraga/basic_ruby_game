name1 = "larry"
health1 = 60

puts "#{name1.capitalize} has a health of #{health1}."

name2 = "curry"
health2 = 125

puts "#{name2.upcase} has a health of #{health2}."

name3 = "moe"
health3 = 100

title = "#{name3.capitalize} has a health of #{health3}".center(50, '*')

puts title

name4 = "shemp"
health4 = 90

puts "#{name4.capitalize}".ljust(20, '.') + "#{health4}"

current_time = Time.new

puts current_time.strftime("%A, %d %b %Y %l:%M %p")

