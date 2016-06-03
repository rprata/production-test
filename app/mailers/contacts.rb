class Contacts < ActionMailer::Base
  default to: "bioling.patricia@gmail.com"

  def email(contact)
    @contact = contact
    mail(from: @contact.email, subject: '[Bioling Test] Question')
  end

end
