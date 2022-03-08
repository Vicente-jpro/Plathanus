small_numbers = {

	zero: {number: 0, name: "zero" },
	one: {number: 1, name: "one" },
	two: {number: 2, name: "one" },
	three: {number: 3, name: "one" },
	four: {number: 4, name: "one" },
	five: {number: 5, name: "one" },
	six: {number: 6, name: "one" },
	seven: {number: 7, name: "one" },
	eigth: {number: 8, name: "one" },
	nine: {number: 9, name: "one" },
	ten: {number: 10, name: "one" },
	eleven: {number: 11, name: "one" },
	twelve: {number: 12, name: "one" },
	thirteen: {number: 13, name: "one" },
	fourteen: {number: 14, name: "one" },
	fifteen: {number: 15, name: "one" },
	sixteen: {number: 16, name: "one" },
	seventeen: {number: 17, name: "one" },
	eighteen: {number: 18, name: "one" },
	nineteen: {number: 19, name: "one" },
	twenty: {number: 20, name: "one" },
	thirty: {number: 30, name: "one" },
	forty: {number: 40, name: "one" },
	fifty: {number: 50, name: "one" },
	sixty: {number: 60, name: "sixty" },
	seventy: {number: 70, name: "seventy" },
	eighty: {number: 80, name: "eighty" },
	ninety: {number: 90, name: "ninety" }
	}

larg_numbers = {
	hundred: {number: 100, name: "hundred" },
	thousand: {number: 1000, name: "thousand" }
}

join_and = "and"



def put_numbers_into_array(current_number)
	
	number_storage = []

	while current_number > 0
		last_number = current_number%10
		number_storage << last_number
		current_number /= 10
	end
	return number_storage.reverse
end

def give_a_name_to_numbers(numbers_array, hash_numbers)
   
end


def get_number_name(current_number)
  numbers_array = put_numbers_into_array(current_number)
  number_name = ""

  if current_number >= 100 
  	larg_numbers = give_a_name_to_numbers(numbers_array, larg_numbers)
  else
  	number_name = give_a_name_to_numbers(numbers_array, small_numbers)
  end


end

puts put_numbers_into_array(1234)