source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'

# # assets
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'therubyracer'
gem 'compass-rails', '~> 3.1.0'
gem 'fancy-buttons'
gem 'font-awesome-sass'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use mina for deployment
gem 'mina', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# auth
gem 'authlogic'
gem 'scrypt'
gem 'cancancan'

# models
gem 'acts_as_tree'
gem 'countries', require: 'countries/global',
    github: 'dima4p/countries'
gem 'country_select'
gem 'i18n-timezones'
gem 'scenic'
gem 'slug'
gem 'traco'
# gem 'docker-api'

# data processing
gem 'mechanize'
gem 'jsonpath'

# jobs
gem 'sidekiq'

# views
gem 'haml-rails'
gem 'nested_form'
gem 'simple_form'
gem 'wice_grid', github: 'dima4p/wice_grid'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails'
  gem 'guard-bundler', require: false
  gem 'guard-rspec'
  gem 'rspec-activemodel-mocks'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'

  # To load the directory
  gem 'require_all'
  gem 'multi_json'
  gem 'translations_sync'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'annotate'

  # i18n + templates and tools
  gem 'active_record_model_and_rspec_enhanced_templates'
  gem 'advanced_haml_scaffold_generator'
  gem 'i18n_scaffold_controller_template'
  gem 'i18n_scaffold_generator'
  gem 'jbuilder_rspec_generator'
  gem 'rspec_rails_scaffold_templates'
end

group :test do
  gem 'factory_bot_rails', github: 'dima4p/factory_bot_rails'
end

# # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
