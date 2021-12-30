def period
  Time.new.strftime("%B %Y")
end


def fund_project(project_name, fund=150)
  "The project: #{project_name} received a funding of #{fund} for the next period: #{period}"
end

puts fund_project("NFT_collective")
puts fund_project("Elder help", 500)
puts fund_project("Elder dogs", 900)
