require './modules/numbers.rb'
require './modules/validate_hash.rb'
require './modules/array_number.rb'
class Option2
	
	include Numbers
	include ValidateHash
	include ArrayNumber

	attr_accessor :number_storage, :current_number

	def get_number_name
		

		number_name = nil

		if smallest_number?
			number_name = get_name(@current_number, smallest_numbers)
		elsif small_number?
			number_name = get_name(@current_number, small_numbers)
			if number_name.nil?
				number_name = get_a_new_name_built(@current_number)	
			end
		elsif larg_number_hundred?
			number_name = get_name(@current_number, large_numbers)
			if number_name.nil?
				number_name = get_a_new_name_built(@current_number)
			end
		else
			number_name = get_name(@current_number, large_numbers)
			if number_name.nil?
				array_of_numbers = convert_number_to_array(@current_number)
				number1 = get_first_number_from_array(array_of_numbers)
			    array_of_numbers.shift
			    
			    number_name = "#{get_name(number1, smallest_numbers)} thousand, and #{get_name_of_three_digits(array_of_numbers)}"
			   
				name = number_name.to_s
				number_name = name.gsub(' and zero hundred', '')
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
	  elsif small_number?
	  	number_name = get_name(@current_number, small_numbers)
		if number_name.nil?
			number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_a_new_name_built(number2)}"
  		end
	  	
	  end
	  name = number_name.to_s
	  number_name = name.gsub('and zero', '')
	  number_name = name.gsub('zero','')
	  return number_name
	end

	def get_a_new_name_built(unknown_number)
	 

	  if small_number?
	  	array_of_numbers = convert_number_to_array(unknown_number)
	    number_name = get_name_of_two_digits(array_of_numbers)
	  elsif larg_number_hundred?
			number1 = unknown_number/100
			number2 = unknown_number%100

			if number2 >19		
			   if number_end_with_zero(number2)
				number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_name(number2, small_numbers)}"
			   else
				array_of_numbers = convert_number_to_array(number2)
				array_of_numbers.shift
				number_name = "#{get_name(number1, smallest_numbers)} hundred and #{ get_name_of_two_digits(array_of_numbers)}"
				end
			else
			  number_name = "#{get_name(number1, smallest_numbers)} hundred and #{get_name(number2, smallest_numbers)}"
		    end
	   else

	  end

	  return number_name
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

	def number_end_with_zero(number)
		number%10 == 0
	end


	def get_name(current_number, hash_numbers)

	  hash_numbers.each do |key, value|
			if value[:number] == current_number
				return value[:name]
			end
	  end
	  return nil
	end

end


#317
n = Option2.new
(1000..1021).each do |num|
	n.current_number = num
	
	  puts n.get_number_name
end




