require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstagramClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.i18n.default_locale = :en
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:en, :ja]
    config.time_zone = "Tokyo"
    config.generators do |g|
      g.assets false
      g.helper false
    end
    config.load_defaults 5.2
  end
end

module YourApp
  class Application < Rails::Application
    config.generators do |g|
      g.assets     false
      g.helper     false
    end
  end
end
