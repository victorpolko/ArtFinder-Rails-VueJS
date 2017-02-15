source 'https://rubygems.org'
ruby '2.2.3'
gem 'rails', '4.2.4'

# Database
gem 'pg',                 '~> 0.19.0'

# Frontend
gem 'autoprefixer-rails', '~> 5.2'
gem 'coffee-rails',       '~> 4.1.0'
gem 'jquery-ui-rails',    '~> 6.0.1'
gem 'sass',               '~> 3.4'
gem 'sass-rails',         '~> 5.0.3'
gem 'haml',               '~> 4.0.7'
gem 'sprockets',          '~> 3.2.0'

# Utils
gem 'kaminari',  '~> 1.0.1'
gem 'paperclip', '~> 4.2'

group :development do
  gem 'better_errors'
  gem 'jazz_hands',        github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'letter_opener_web', '~> 1.2.0'
  gem 'quiet_assets',      '>= 1.0.2'
  gem 'spring'
  gem 'thin'
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'database_cleaner'
end
