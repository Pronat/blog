class ContactsController < ApplicationController
	def new
	end

	def create
		@contact = Contact.new(contact_params)
		if@contact.valid?
			@contact.save  #если валидация true, то возвращаем app/views/contacts/screate.html.erb
		else
			render action: 'new'	#запускаем метод def new (action)
		end
	end

	private
	def contact_params
		params.require(:contact).permit(:email, :message)
	end
end
