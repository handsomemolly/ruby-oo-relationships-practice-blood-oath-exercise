require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new('Cult 1', 2001, 'crush your enemies', 'florida')
cult2 = Cult.new('Cult 2', 2002, 'crush your enemies again', 'key west')
cult3 = Cult.new('Cult 3', 2003, 'crush your enemies thrice', 'miami')
cult4 = Cult.new('Cult 4', 2004, 'crush your enemies thrice again', 'miami')
cult5 = Cult.new('Cult 5', 2005, 'more clothes less fun', 'utah', 16)

follower1 = Follower.new('Carl', 21, 'yolo')
follower2 = Follower.new('Stanley', 22, 'I love friendship')
follower3 = Follower.new('Garth', 23, 'Get clout')

cult1.recruit_follower(follower1, '2020-01-01')
cult1.recruit_follower(follower2, '2020-03-01')
cult2.recruit_follower(follower3, '2020-02-01')
cult2.recruit_follower(follower1, '2020-01-01')

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits