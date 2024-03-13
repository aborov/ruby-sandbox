# /debugger.rb

require "pry-byebug"

unpredictable_inputs = [
  "Hello!",
  Time.now,
  rand(100),
  :GOODBYE,
  nil,
  true,
  false,
  { :city => "Chicago", :state => "IL", :zip => 60654 }
]

some_random_input = unpredictable_inputs.sample


byebug

if some_random_input == nil
	print "no object provided"
elsif some_random_input == true
	print "you may pass"
elsif some_random_input == false
	print "you may not pass"	
elsif some_random_input.class == "String"
	some_random_input.downcase
	print some_random_input
elsif some_random_input.class == "Time"
	require "date"
	day = some_random_input.wday
		if day == 0
			print "sunday"
		elsif day == 1
			print "monday"
		elsif day == 2
			print "tuesday"
		elsif day == 3
			print "wednesday"
		elsif day == 4
			print "thursday"
		elsif day == 5
			print "friday"
		elsif day == 6
			print "saturday"
		else
			pp "Wday error"
		end
elsif some_random_input.class == "Integer"
	if some_random_input.odd? == "true"
		print "#{some_random_input} is odd"
	else
		print "#{some_random_input} is even"
	end
elsif some_random_input.class == "Symbol"
	some_random_input.downcase
	print some_random_input
elsif some_random_input.class == "Hash"
	print some_random_input.keys
else
	pp "Input error!"
end
