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

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'bootstrap-sass', '~> 3.0.1.0.rc'
  s.add_dependency 'font-awesome-sass-rails'
  s.add_dependency 'rspec-rails'
end
