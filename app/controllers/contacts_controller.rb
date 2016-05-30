class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
	    @contact = Contact.new(contact_params) 
	    if @contact.save
	    	Contacts.email(@contact).deliver
	      	flash[:success] = "email was sent!"
	      	redirect_to '/contact'
	    else 
			render 'new'	 
	    end
	end

	private
	def contact_params 
		params.require(:contact).permit(:name, :email, :message)
	end
end
