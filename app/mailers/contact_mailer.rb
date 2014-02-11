class ContactMailer < ActionMailer::Base
  default :from => "support@hamarasouk.com"
  layout 'mailer'
  
  def contact_email(details)
    @details = details
    mail(:to => HAMARA_SOUK_EMAIl, :subject => 'Contacted Message from Hamarasouk user')
  end
end
