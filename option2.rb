smallest_numbers = {

	zero: {number: 0, name: "zero" },
	one: {number: 1, name: "one" },
	two: {number: 2, name: "two" },
	three: {number: 3, name: "three" },
	four: {number: 4, name: "four" },
	five: {number: 5, name: "five" },
	six: {number: 6, name: "six" },
	seven: {number: 7, name: "seven" },
	eigth: {number: 8, name: "eigth" },
	nine: {number: 9, name: "nine" },
	ten: {number: 10, name: "ten" },
	eleven: {number: 11, name: "eleven" },
	twelve: {number: 12, name: "twelve" },
	thirteen: {number: 13, name: "thirteen" },
	fourteen: {number: 14, name: "fourteen" },
	fifteen: {number: 15, name: "fifteen" },
	sixteen: {number: 16, name: "seventeen" },
	seventeen: {number: 17, name: "seventeen" },
	eighteen: {number: 18, name: "eighteen" },
	nineteen: {number: 19, name: "nineteen" }
}

small_numbers = {
	twenty: {number: 20, name: "twenty" },
	thirty: {number: 30, name: "thirty" },
	forty: {number: 40, name: "forty" },
	fifty: {number: 50, name: "fifty" },
	sixty: {number: 60, name: "sixty" },
	seventy: {number: 70, name: "seventy"},
	eighty: {number: 80, name: "eighty" },
	ninety: {number: 90, name: "ninety" }
}

large_numbers = {
	hundred: {number: 100, name: "hundred" },
	thousand: {number: 1000, name: "thousand" }
}

join_and = "and"




class Option2
	attr_accessor :number_storage, :current_number,
				  :smallest_numbers, :small_numbers, :large_numbers

	def get_number_name
	  array_of_numbers = put_numbers_into_array
	  number_name = ""

	  if smallest_number?
	  	number_name = get_name_from_smallest_number(array_of_numbers, smallest_numbers)
	  elsif small_number?
	  	number_name = give_a_name_to_numbers(array_of_numbers, small_numbers, smallest_numbers)
	  else
	  	number_name = give_a_name_to_numbers(array_of_numbers, large_numbers)
	  end
	  return number_name

	end

		def put_numbers_into_array
			
			@number_storage = [0]

			while @current_number > 0
				last_number = @current_number%10
				@number_storage << last_number.to_s
				@current_number /= 10
			end
			return @number_storage.reverse
		end

		def give_a_name_to_numbers(array_of_numbers, hash_numbers)

		end


		def get_name_from_smallest_number(array_of_numbers, smallest_numbers)
			
			number_name = ""
			@current_number = concatinate_array_of_numbers(array_of_numbers)
			smallest_numbers.each do |key,value| 
			 number_position = value[:number]

				 if value[:number] == @current_number
				  number_name += key.to_s
				  break
				end
			end
			return number_name
		end

		def get_name_from_small_number(array_of_numbers, small_numbers)
			puts small_numbers
			number_name = ""
			@current_number = concatinate_array_of_numbers(array_of_numbers)
			puts "complete number = #{@current_number}"

			small_numbers.each do |key,value| 
			 number_position = value[:number]

				 if value[:number] == @current_number
				   puts "#{key}"
				  break
				end
			end

			return number_name
		end


		def concatinate_array_of_numbers(array_of_numbers)
		  return (array_of_numbers[0]+""+array_of_numbers[1]).to_i
		end

		def small_number?
			@current_number < 100
		end
		def smallest_number?
			@current_number <= 19
		end

end



n = Option2.new
n.current_number = 11
n.smallest_numbers = smallest_numbers
n.small_numbers = small_numbers
puts n.get_number_name

