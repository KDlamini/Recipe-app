# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
    :user_name => ENV['SEND_USERNAME'],
    :password => ENV['SEND_PASSWORD'],
    :domain => 'gmail.com',
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true,
    open_timeout:         5,
    read_timeout:         5
}