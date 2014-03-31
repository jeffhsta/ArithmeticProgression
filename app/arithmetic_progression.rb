class ArithmeticProgression
	
	def run(numbers)
		return [] if invalid_numbers? numbers

		@numbers = numbers.sort
		@sets = []
		@next_value = 0

		while @next_value != nil do
			@next_value += 1
			add_sets_from_next_value
		end

		@sets
	end

	private

	def invalid_numbers?(numbers)
		numbers == nil || numbers == []
	end

	def set_contains_next_value_this_set?(set)
		set.last != nil && @numbers.include?(set.last + @next_value)
	end

	def add_set_in_sets_if_is_possible(set)
		if set.length >= 3
			@sets.push set
			return true
		end

		@last_index += 1
		false
	end

	def redefine_set_value
		if @numbers.length <= (@last_index + 2) then nil else [@numbers[@last_index]] end
	end

	def add_sets_from_next_value
		set = [@numbers.first]
		@last_index = 1
		added = false
		
		while set != nil do
			if set_contains_next_value_this_set?(set)
				@last_index = @numbers.index(set.last + @next_value)
				set.push(set.last + @next_value)
			else
				added = add_set_in_sets_if_is_possible set
				
				set = redefine_set_value
			end
		end

		@next_value = nil if !added
	end
end
