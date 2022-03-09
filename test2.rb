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

		number_name = ""

		if smallest_number?
			number_name = get_name(@current_number, smallest_numbers)
		elsif small_number?
			number_name = get_name(@current_number, small_numbers)
			if number_name.nil?
				array_of_numbers = convert_number_to_array(@current_number)
				number_name = get_name_of_two_digits(array_of_numbers)
			end
		elsif larg_number_hundred?
			number_name = get_name(@current_number, large_numbers)
			if number_name.nil?
				number1 = @current_number/100
				number2 = @current_number%100
				if number2 >19
				  number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_name(number2, small_numbers)}"
				else
				  number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_name(number2, smallest_numbers)}"
			 	end
			end
		else
			number_name = get_name(@current_number, large_numbers)
			if number_name.nil?
				array_of_numbers = convert_number_to_array(@current_number)
				number1 = get_first_number_from_array(array_of_numbers)
			    array_of_numbers.shift
			    number_name = "#{get_name(number1, smallest_numbers)} thousand, #{get_name_of_three_digits(array_of_numbers)}"
	 
			end
		end

		return number_name 
	end
	def get_name_of_two_digits(array_of_numbers)
  	  number1 = get_first_number_and_add_zero_from_array(array_of_numbers)
	  number2 = get_last_number_from_array(array_of_numbers)
	  number_name = "#{get_name(number1, small_numbers)} #{get_name(number2, smallest_numbers)}"
	  return number_name
	end

	def get_name_of_three_digits(array_of_numbers)
	  number1 = get_first_number_from_array(array_of_numbers)
	  array_of_numbers.shift
	  number2 = (array_of_numbers.first.to_s+""+array_of_numbers.last.to_s).to_i
	  @current_number = number2

	  if smallest_number?
	  	number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_name(number2, smallest_numbers)}"
	  else
	  	number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_name(number2, small_numbers)}"
	  end
	  return number_name
	end
	def get_first_number_and_add_zero_from_array(array_of_numbers)
	  (array_of_numbers.first.to_s+"0").to_i
	end
	def get_middle_number_and_add_zero_from_array(array_of_numbers)
		array_of_numbers.shift
		return (array_of_numbers.first.to_s+"0").to_i
	end
	def get_first_number_from_array(array_of_numbers)
	  (array_of_numbers.first.to_s).to_i
	end

	def get_last_number_from_array(array_of_numbers)
	  (array_of_numbers.last.to_s).to_i
	end
	def convert_number_to_array(number)
			@number_storage = []

			while @current_number > 0
				last_number = @current_number%10
				@number_storage << last_number.to_s
				@current_number /= 10
				
			end
			return @number_storage.reverse
	end



	def get_name(current_number, hash_numbers)

	  hash_numbers.each do |key, value|
				if value[:number] == current_number
					return value[:name]
				end
	  end
	  return nil
	end

	def smallest_number?
	  ( (@current_number >= 0) and (@current_number<=19) )
	end
	def small_number?
		((@current_number >= 20) and (@current_number <= 99))
	end

	def larg_number_hundred?
		((@current_number >= 100) and (@current_number <= 999))
	end
end


#317
n = Option2.new
1317.times do |num| 
n.current_number = num
n.smallest_numbers = smallest_numbers
n.small_numbers = small_numbers
n.large_numbers = large_numbers
puts n.get_number_name

end