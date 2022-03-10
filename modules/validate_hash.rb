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
end