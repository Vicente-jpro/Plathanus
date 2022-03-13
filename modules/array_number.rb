module ArrayNumber
 	
 	def get_first_number_and_add_zero_from_array(array_of_numbers)
	  (array_of_numbers.first.to_s+"0").to_i
	end
	
	def get_first_number_from_array(array_of_numbers)
	  (array_of_numbers.first.to_s).to_i
	end

	def get_last_number_from_array(array_of_numbers)
	  (array_of_numbers.last.to_s).to_i
	end
 
 end 