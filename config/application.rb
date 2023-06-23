require_relative "boot"
require 'dotenv/load'
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VirtualProductManagment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    Dotenv.load('.env')
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    
    # Enable CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Allow requests from all origins
        resource '*', headers: :any, methods: [:get, :post, :options] # Allow GET, POST, and OPTIONS requests
      end
    end
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
