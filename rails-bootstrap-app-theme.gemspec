$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails-bootstrap-app-theme/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails-bootstrap-app-theme'
  s.version     = RailsBootstrapAppTheme::VERSION
  s.authors     = ['Angus Miller']
  s.email       = ['all4miller@gmail.com']
  s.homepage    = 'https://github.com/cloudbi/rails-bootstrap-app-theme'
  s.summary     = 'Basic web app theme using twitter bootstrap'
  s.description = 'This gem provides common layouts built using twitter boostrap. It alsp provides a collection of helpers the assit with common tasks like building navbars and sidebars'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '4.2.6'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'bootstrap-sass', '~> 2.3.2.0'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'rspec-rails'
end
