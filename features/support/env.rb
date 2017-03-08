require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'rspec'
require 'rspec/expectations'
require 'rspec/matchers'
require 'capybara/rspec'
require 'cucumber'
require 'report_builder'
# require 'faker'
#require 'active_support/core_ext/string/inflections'
# require 'sort'
# require 'tiny_tds'
#require 'time_difference'
# require 'pry'
# require 'waitutil'
require 'date'
require 'time'
#require_relative 'misc'
include RSpec::Matchers
#include Misc

#$users = load_yaml_file('../config/users')

#$police_portal = "https://auto.v3.police.dors/login.aspx"
#$offender_portal = "https://auto.v3.offer.dors"
#$supplier_portal = "https://auto.v3.supplier.dors/login.aspx"
# choose a driver, if its not given, then default is firefox


if ENV['DRIVER'] == 'chrome'
  Capybara.default_driver = :chrome
elsif ENV['DRIVER'] == 'firefox'
  Capybara.default_driver = :firefox
else
   Capybara.default_driver = :chrome
  #Capybara.default_driver = :chrome
end

#Capybara.configure do |config|
 # config.app_host = "https://auto.v3.offer.dors"
  #config.app_host = "http://publish.test.planetradio.co.uk/sign-in"
  #config.default_max_wait_time = 25
#end

# io = File.open(File.dirname(__FILE__) + "/../../config/users.yml")

#users = YAML.load_file(io)
#World(Capybara)

#Capybara.register_driver :selenium do |app|
#  Selenium::WebDriver::Remote::Http::Default.new
#  Capybara::Selenium::Driver.new(app, :browser => :firefox)
#end

#Capybara.register_driver :selenium_with_long_timeout do |app|
#  client = Selenium::WebDriver::Remote::Http::Default.new
#  client.timeout = 120
#  Capybara::Selenium::Driver.new(app, :browser=>:firefox,:http_client => client)
#end

#Selenium::WebDriver::Chrome::Service.executable_path = '/Users/jayapriyakannan/cmspublish/chromedriver.exe'

  Capybara.configure do |config|
     config.default_driver = :selenium
  end
   World(Capybara)


   Capybara.register_driver :selenium do |app|
   Capybara::Selenium::Driver.new(app, :browser => :chrome)
   end

   Capybara.javascript_driver = :chrome

  $url = "http://publish.test.planetradio.co.uk/sign-in"
   Capybara.configure do |config|
     config.default_max_wait_time = 10

     config.app_host = $url
   config.ignore_hidden_elements = false
 end
