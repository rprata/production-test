class AdminController < ApplicationController

	before_action :require_user, only: [:index, :statistics]

	def index
		@test_results = Test.all
	end

	def statistics
		@test_results = Test.all
	end

end
