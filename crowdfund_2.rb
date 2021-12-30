class Project

  attr_accessor :name, :funding

  def initialize(name, funding=0, goal=3000)
    @name = name
    @funding = funding
    @goal = goal
  end

  def remaining
    @goal - @funding
  end

  def get
    @funding += 25
    "#{@name} got more funds!"
  end

  def loose
    @funding -= 15
    "#{@name} lost some funds!"
  end

  def to_s
    "Project #{@name} has #{@funding} in funding towards a goal of #{@goal}. Remaining is: #{remaining}"
  end

end

projects = %w(XYZ LMN)

projects[projects.length - 1] = "123"
puts "There are #{projects.size} projects in the game:"


projects.each do |project|
  funding = rand(10..30)
  p = Project.new(project, funding)
  puts p
  puts p.get
  puts p.loose
end

# There are 3 players in the game:
# I'm Moe with a health of 100 and a score of 103.
# I'm Larry with a health of 60 and a score of 65.
# I'm Curly with a health of 125 and a score of 130.


