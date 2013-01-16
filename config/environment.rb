# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
GreatBritishDangerzone::Application.initialize!

#gmail

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address    => "smtp.gmail.com",
    :port     => 587,
    :domain     => "gmail.com",
    :user_name    => ENV["GMAIL_UN"],
    :password   => ENV["GMAIL_PASS"],
    :authentication => "plain",
    :enable_starttls_auto => true
  }
