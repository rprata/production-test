class Contacts < ActionMailer::Base
  default to: "renancprata@gmail.com"

  def email(contact)
    @contact = contact
    mail(from: @contact.email, subject: '[Bioling Test] Question')
  end

end
