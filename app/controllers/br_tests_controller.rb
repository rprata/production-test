# encoding: UTF-8
class BrTestsController < ApplicationController
		before_action :require_user, only: [:show, :delete]


	def get_total_wrong_answers(test)
		counter = 0
		if test.answer_1.eql? "logicamente"
			counter += 1
		end
		if test.answer_2.eql? "passados"
			counter += 1
		end
		if test.answer_3.eql? "retratado"
			counter += 1
		end
		if test.answer_4.eql? "Por isso"
			counter += 1
		end
		if test.answer_5.eql? "ficaria"
			counter += 1
		end
		if test.answer_6.eql? "entendesse"
			counter += 1
		end
		if test.answer_7.eql? "escutou"
			counter += 1
		end
		if test.answer_8.eql? "quem"
			counter += 1
		end
		if test.answer_9.eql? "existir"
			counter += 1
		end
		if test.answer_10.eql? "ruim"
			counter += 1
		end
		if test.answer_11.eql? "desde"
			counter += 1
		end
		if test.answer_12.eql? "verei"
			counter += 1
		end
		if test.answer_13.eql? "ave"
			counter += 1
		end
		if test.answer_14.eql? "morasse"
			counter += 1
		end
		if test.answer_15.eql? "Corra"
			counter += 1
		end
		if test.answer_16.eql? "tristeza"
			counter += 1
		end
		if test.answer_17.eql? "gostaria"
			counter += 1
		end
		if test.answer_18.eql? "perder"
			counter += 1
		end

		return counter
	end

	def get_morfo_data(test)
		mp = 0
		mnp = 0
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
		return [["MP", mp],["MNP", mnp]]
	end

	def new
		@test = BrTest.new
	end

	def create 
	    @test = BrTest.new(test_params)
	    @test.wrong_answers = get_total_wrong_answers(@test)
	    if @test.save
	      flash[:success] = "works!"
	      redirect_to '/texto'
	    else 
	      ## add error message
	      render 'new'	 
	    end
	end

	def show 
		@test_result = BrTest.find(params[:id]) 
		@data = get_morfo_data(@test_result)
	end

	def destroy
		@test = BrTest.find(params[:id])
		@test.destroy
		redirect_to '/admin-br'
	end

	private
	def test_params 
		params.require(:br_test).permit(:name,
									 :gender,
									 :age,
									 :hometown,
									 :education,
									 :occupation,
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
									 :wrong_answers,
									 ) 
	end
end
