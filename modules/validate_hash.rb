module ValidateHash
	def smallest_number?
	  ( (@current_number >= 0) and (@current_number<=19) )
	end
	
	def small_number?
		((@current_number >= 20) and (@current_number <= 99))
	end

	def larg_number_hundred?
		((@current_number >= 100) and (@current_number <= 999))
	end

	def number_end_with_zero?(number)
		number%10 == 0
	end

	def number_less_than_hundred?(number)
		number%1000 < 100
	end

	def number_more_than_one_thousand?(number)
		number >= 2000
	end

end