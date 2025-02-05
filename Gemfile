source "https://rubygems.org"
ruby "3.3.7"
# Rails core
gem "rails", "~> 8.0.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"


# Utilities
gem "bootsnap", require: false

# API requirements
gem "dotenv-rails"
gem "rack-cors"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
