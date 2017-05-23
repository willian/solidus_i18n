source "https://rubygems.org"

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem "solidus", github: "solidusio/solidus", branch: branch

# Provides basic authentication functionality for testing parts of your engine
gem 'solidus_auth_devise', '~> 1.0'

if branch == 'master' || branch >= "v2.0"
  gem "rails-controller-testing", group: :test
end

if ['v1.1', 'v1.2'].include? branch
  gem 'rails', '4.2.4'
  gem 'mysql2', '~> 0.3.18'
else
  gem 'mysql2'
end

gem 'pg'
gem 'sqlite3'

group :development, :test do
  gem "pry-rails"
end

gemspec
