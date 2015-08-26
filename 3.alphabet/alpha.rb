#require 'profile'
def check_in_alphabetical_seq(str)
	compare = "a"
	str.scan(/./).each do |c|
		if c < compare
			return false 
		else
			compare = c
		end
	end
	true
end

def proper_output(bool)
	if bool
		"IN ORDER"
	else
		"NOT IN ORDER"
	end
end

lines = File.readlines("input.txt")
lines.each do |l| 
	puts "#{l.chomp}, #{proper_output(check_in_alphabetical_seq(l))}"
end
