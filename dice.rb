require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do 
   
  erb(:elephant)

end


get("/dice/2/6") do 
  
  roll_one = rand(1..6)
  
  roll_two = rand(1..6)
  
 sum = roll_one + roll_two

 @outcome =  "dice roll 1: #{roll_one} dice roll 2: #{roll_two} together is #{sum}"

 
erb(:two_six)

end 

get("/dice/2/10") do 

roll_one = rand(1..10)

roll_two = rand(1..10)

sum = roll_one + roll_two

@output = "roll 1: #{roll_one} and roll 2: #{roll_two} together is #{sum}"


 

erb(:two_ten)



end

get("/dice/1/20") do 

  @roll_one = rand(1..20)

@output = "you rolled: #{@roll_one}"



erb(:one_twenty)

end 


get("/100/6") do
  @rolls = []
100.time do 
 die = rand(1..6)
 @rolls.push(die)
erb(:one_hundred_six)


end
end
