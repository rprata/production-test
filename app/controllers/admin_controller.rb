# encoding: UTF-8
class AdminController < ApplicationController

	before_action :require_user, only: [:index, :index_br, :statistics, :statistics_br]

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
				if test.answer_6.eql? "don’t understand"
					mnp += 1
				elsif test.answer_6.eql? "isn’t understanding"
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

	def get_all_morfo_data_br(tests)
		mp = 0
		mnp = 0
		tests.each do |test|
			if test.wrong_answers < 3
				if test.answer_5.eql? "fica"
					mnp += 1
				elsif test.answer_5.eql? "está ficando"
					mp += 1
				end
				if test.answer_6.eql? "entendo"
					mnp += 1
				elsif test.answer_6.eql? "estou entendendo"
					mp += 1
				end
				if test.answer_9.eql? "existe"
					mnp += 1
				elsif test.answer_9.eql? "está existindo"
					mp += 1
				end
				if test.answer_12.eql? "vejo"
					mnp += 1
				elsif test.answer_12.eql? "estou vendo"
					mp += 1
				end
				if test.answer_14.eql? "mora"
					mnp += 1
				elsif test.answer_14.eql? "está morando"
					mp += 1
				end
				if test.answer_17.eql? "gosto"
					mnp += 1
				elsif test.answer_17.eql? "estou gostando"
					mp += 1
				end
			end
		end
		return [["MP", mp],["MNP", mnp]]
	end

	def index
		@test_results = Test.all
	end

	def index_br
		@test_results = BrTest.all
	end

	def statistics
		@test_results = Test.all
		@data = get_all_morfo_data(@test_results)
	end

	def statistics_br
		@test_results = BrTest.all
		@data = get_all_morfo_data_br(@test_results)
	end

end
