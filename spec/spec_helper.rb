ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
 config.after(:each) do
   Budget.all.each() do |budget|
     budget.destroy()
   end
   District.all.each() do |district|
     district.destroy()
   end
   Cuisine.all.each() do |cuisine|
     cuisine.destroy()
   end
   Match.all.each() do |match|
     match.destroy()
   end
   Restaurant.all.each() do |restaurant|
     restaurant.destroy()
   end
   User.all.each() do |user|
     user.destroy()
   end
 end
end
