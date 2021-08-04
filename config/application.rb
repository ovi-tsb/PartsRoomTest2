require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

 # config.autoload_paths << Rails.root.join(‘lib’)


module Template
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    
    
    # config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : :async
  end
end





