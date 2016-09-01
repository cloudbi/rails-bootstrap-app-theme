require 'rails-bootstrap-app-theme/helper'
require 'bootstrap-sass'
require 'font-awesome-sass-rails'

module RailsBootstrapAppTheme
  class Engine < ::Rails::Engine
    ActionController::Base.helper RailsBootstrapAppTheme::Helper
  end
end
