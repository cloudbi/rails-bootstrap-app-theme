$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails-bootstrap-app-theme/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails-bootstrap-app-theme'
  s.version     = RailsBootstrapAppTheme::VERSION
  s.authors     = ['Angus Miller']
  s.email       = ['angus@shuntyard.co.za']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of RailsBootstrapAppTheme.'
  s.description = 'TODO: Description of RailsBootstrapAppTheme.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 3.2.13'
  s.add_dependency 'sass-rails', '~> 3.2'
  s.add_dependency 'bootstrap-sass', '~> 2.3.1.0'
  s.add_dependency 'font-awesome-sass-rails'
  s.add_dependency 'rspec-rails'
  s.add_dependency 'sqlite3'
end
