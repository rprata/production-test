class TestsController < ApplicationController

	before_action :require_user, only: [:show]
	
	def new
		@test = Test.new
	end

	def create 
	    @test = Test.new(test_params) 
	    if @test.save!
	      flash[:success] = "works!"
	      redirect_to '/text'
	    else 
	      ## add error message
	      render 'new'	 
	    end
	end

	def index

	end

	def show 
		@test_result = Test.find(params[:id]) 
	end

	def contact
		
	end

	private
	def test_params 
		params.require(:test).permit(:name,
									 :gender,
									 :age,
									 :hometown,
									 :education,
									 :email,
									 :bilingual,
									 :foreign,
									 :answer_1,
									 :answer_2,
									 :answer_3,
									 :answer_4,
									 :answer_5,
									 :answer_6,
									 :answer_7,
									 :answer_8,
									 :answer_9,
									 :answer_10,
									 :answer_11,
									 :answer_12,
									 :answer_13,
									 :answer_14,
									 :answer_15,
									 :answer_16,
									 :answer_17,
									 :answer_18,
									 ) 
	end

end
