# Load the Rails application.
require File.expand_path('../application', __FILE__)

Paperclip.options[:command_path] = "C:/Ruby23/ImageMagick"
ENV['PATH'] = Paperclip.options[:command_path] + ';' + ENV['PATH']


# Initialize the Rails application.
Rails.application.initialize!
