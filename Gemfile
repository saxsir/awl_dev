source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'devise' , :git => 'git://github.com/plataformatec/devise.git'
gem 'rails_admin'

group :development do
  gem 'erb2haml'
end

# payment API
# とりあえずpaypalだけ
gem 'paypal-express'

#production/development
#プロダクションモードではsqlite3を使うのは推奨されない
#一応コメントにしておく
=begin
grop :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end
=end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'jquery-rails'
  # gem 'twitter-bootstrap-rails'
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  gem 'haml-rails'
  gem 'ui_datepicker-rails3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
