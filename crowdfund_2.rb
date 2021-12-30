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

project2 = Project.new("XYZ", 60)
puts project2.name
project2.name = "LMN"
puts project2.name
puts project2.funding
puts project2.remaining
puts project2
