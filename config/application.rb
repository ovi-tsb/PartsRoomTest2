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
    
    # config.eager_load_paths << Rails.root.join("extras")
    # config.eager_load_paths << Rails.root.join('lib')

    # config.autoload_paths << Rails.root.join(‘lib’)

    # config.paths.add Rails.root.join('lib').to_s, eager_load: true

  end
end



module TutorialWillPaginate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('lib')
  end
end


