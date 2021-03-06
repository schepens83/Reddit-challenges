	class Reverse_fizz_buzz

		def initialize(input)
			@input_nrs = {}
			@input_rslts = input
			("a"..last_letter).to_a.join.each_char { |chr| @input_nrs[chr] = 1 }
			@max_int = 20
		end

		#returns last letter from input array.
		def last_letter
			@input_rslts.join.chars.to_a.uniq.sort[-1,1].join
		end
		
		#does the fizz buzz game for a given set of input integers.
		#tries the input for correctness with each consecutive letter. 
		#breaks from the function as soon as the solution can't be valid.
		def fizz_buzz?
			j = 0
			(1..@max_int).each do |i|
				s = ""
				@input_nrs.each do |key, value|
					s = s + key if i % value == 0
				end
				if s.length > 0
					if @input_rslts[j].to_s != s
						return false
					end
					j += 1
				end
				break if j == @input_rslts.length
			end
			if j == @input_rslts.length
				return true
			else
				return false
			end
		end

		#generates all possible permutations given input length and how high the integers can go.
		#then for each permutation loop, set the input for fizz buzz and run fizz_buzz.
		def start_first_solution
			(1..@max_int).to_a.repeated_permutation(@input_nrs.length).to_a.each do |arr|
				@input_nrs.keys.each_with_index do |key, index|
				   @input_nrs[key] = arr[index]
				end
				break if fizz_buzz?
			end
			puts @input_nrs
		end

		#generates all solutions for a fizz buzz output.
		def start_all_solutions
			@solutions = []
			(1..@max_int).to_a.repeated_permutation(@input_nrs.length).to_a.each do |arr|
				@input_nrs.keys.each_with_index do |key, index|
				   @input_nrs[key] = arr[index]
				end
				if fizz_buzz?
					@solutions.push(@input_nrs.to_s)
				end
			end
			puts @solutions
		end
	end

	input1 = ["a", "b", "a", "a", "b", "a"]
	input2 = ["b", "be", "ab", "be", "b", "abe", "b"]
	input3 = ["a", "b", "c", "d", "a", "ab"]
	input_challenge = ["i", "b", "d", "i", "f", "b", "j", "i", "d", "b", "i", "a", "f", "e", "d", "i", "b", "j", "i", "d", "b", "f", "i", "d", "b", "i", "a", "j", "f", "i", "e", "b", "d", "i", "b", "d", "j", "f", "i", "h", "b", "i", "a", "d", "i", "c", "b", "f", "e", "j", "d", "i", "b", "i", "f", "d", "b", "i", "a", "j", "i", "d", "b", "f", "i", "e", "b", "d", "i", "j", "b", "f", "i", "a", "d", "i", "b", "d", "j", "f", "i", "b", "e", "i", "h", "d", "b", "i", "a", "f", "j", "d", "b", "i", "i", "c", "b", "f", "d", "i", "e", "j", "b", "d", "i", "a", "f", "b", "i", "d", "i", "j", "b", "f", "i", "d", "b", "e", "g", "i", "a", "d", "b", "j", "f", "i", "i", "d", "b", "h", "i", "f", "b", "j", "d", "i", "a", "e", "b", "i", "d", "f", "i", "b", "j", "d", "i", "c", "b", "f", "i", "a", "d", "e", "b", "i", "j", "f", "d", "i", "b", "i", "b", "d", "j", "f", "i", "a", "b", "d", "i", "e", "b", "i", "f", "h", "d", "j", "i", "b", "i", "d", "a", "f", "b", "i", "j", "d", "e", "b", "i", "f", "i", "d", "b", "i", "j", "a", "c", "b"]
	Reverse_fizz_buzz.new(input1).start_first_solution
	Reverse_fizz_buzz.new(input2).start_first_solution
	Reverse_fizz_buzz.new(input3).start_first_solution
	# output: {"a"=>3, "b"=>5}
	# output: {"a"=>3, "b"=>1, "c"=>8, "d"=>8, "e"=>2}
	# output: {"a"=>6, "b"=>9, "c"=>10, "d"=>11}


