class AdminController < ApplicationController

	before_action :require_user, only: [:index]

	def index
		@test_results = Test.all
	end

end
