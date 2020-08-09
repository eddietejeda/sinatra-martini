# encoding: utf-8

# Set up environment
require 'sinatra'
require "sinatra/base"
require "sinatra/cookies"
require "sinatra/activerecord"

require 'securerandom'
require 'omniauth'
require 'omniauth-twitter'

require 'pg'
require 'rgeo'
require 'rgeo-activerecord'

require 'sidekiq'
require 'sidekiq/api'
require 'sidekiq/web'

# Stripe settings
require 'stripe'
Stripe.api_key = ENV['STRIPE_SECRET_KEY'] || "secret"

# Curl settings
require 'curb'
Curl::Easy.perform("http://www.google.co.uk") do |curl|
  curl.headers["User-Agent"] = "myapp-0.0"
  curl.verbose = true
end

# Logger settings
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::INFO

## Development only
if settings.development?
  require 'sinatra/reloader' 
  require "byebug" 
  require "awesome_print" 
  logger.level = Logger::DEBUG
end


# Get ready to load app
Dir["./models/*.rb", "./lib/**/*.rb"].each do |file| 
  require file
end

require './app'