require "../app/arithmetic_progression.rb"

describe ArithmeticProgression do
	
	before(:all) do
		@arithmetic_progression = ArithmeticProgression.new
	end

	it "when pass nil should return []" do
		@arithmetic_progression.run(nil).should == []
	end

	it "when pass [] should return []" do
		@arithmetic_progression.run([]).should == []
	end

	it "when pass [1, 2, 3] should return the sets [[1, 2, 3]]" do
		numbers = [1, 2, 3]
		excepted_sets = [[1, 2, 3]]
		@arithmetic_progression.run(numbers).should == excepted_sets
	end

	it "when pass [1, 2, 3, 5, 6, 7, 9] should return the sets [[1, 2, 3], [5, 6, 7], [1, 3, 5, 7, 9], [3, 6, 9], [1, 5, 9]]" do
		numbers = [1, 2, 3, 5, 6, 7, 9]
		excepted_sets = [[1, 2, 3], [5, 6, 7], [1, 3, 5, 7, 9], [3, 6, 9], [1, 5, 9]]
		@arithmetic_progression.run(numbers).should == excepted_sets
	end
end