require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module RailsSandbox
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    require 'unconditional_view/railtie'
  end
end
