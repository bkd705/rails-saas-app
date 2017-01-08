class ContactMailer < ActionMailer::Base
  default to: 'brennenkdenomme@gmail.com'
  # Get instance variables from the contact form and send it as mail
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: name, subject: 'Contact Form Message')
  end
end