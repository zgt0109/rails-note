#---
# Excerpted from "The Rails View",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/warv for more book information.
#---
Artflow::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict
  
  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

 
# While we use the smtp_settings in the book, since this is a running example we
# don't actually contact the SMTP server
   config.action_mailer.raise_delivery_errors = false 
=begin     
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :domain         => "artflowme.com",
    :authentication => "plain",
    :user_name      => "artflow",
    :password       => "secret",
    :enable_starttls_auto => true
  }
=end
  
  # Prevent automated tasks from using letter opener
  # NOTE: Comment out the conditional to see a lot of
  # emails when you `rake db:reset` and the seeds are loaded
  unless File.basename($0) == 'rake'
    config.action_mailer.delivery_method = :letter_opener
  end

  config.action_mailer.default_url_options = {host: 'localhost:3000'}
  
end