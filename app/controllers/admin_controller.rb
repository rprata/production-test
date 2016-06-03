class AdminController < ApplicationController

	before_action :require_user, only: [:index, :statistics]

	def get_all_morfo_data(tests)
		mp = 0
		mnp = 0
		tests.each do |test|
			if test.wrong_answers < 3
				if test.answer_5.eql? "becomes"
					mnp += 1
				elsif test.answer_5.eql? "is becoming"
					mp += 1
				end
				if test.answer_6.eql? "don't understand"
					mnp += 1
				elsif test.answer_6.eql? "is not understanding"
					mp += 1
				end
				if test.answer_9.eql? "doesn’t exist"
					mnp += 1
				elsif test.answer_9.eql? "is not existing"
					mp += 1
				end
				if test.answer_12.eql? "see"
					mnp += 1
				elsif test.answer_12.eql? "am seeing"
					mp += 1
				end
				if test.answer_14.eql? "lives"
					mnp += 1
				elsif test.answer_14.eql? "is living"
					mp += 1
				end
				if test.answer_17.eql? "don’t like"
					mnp += 1
				elsif test.answer_17.eql? "am not liking"
					mp += 1
				end
			end
		end
		return [["MP", mp],["MNP", mnp]]
	end

	def index
		@test_results = Test.all
	end

	def statistics
		@test_results = Test.all
		@data = get_all_morfo_data(@test_results)
	end

end
