require 'allure-cucumber'
require 'cpf_faker'
require 'cucumber'
require 'faker'
require 'httparty'
require 'rspec'
require 'securerandom'
require 'capybara'

HTTP_LOG = ENV['HTTP_LOG']
PAYLOAD_PATH = YAML.load_file("features/support/config/payload_path.yml")
CONFIG_API = YAML.load_file("features/support/config/environment.yml")