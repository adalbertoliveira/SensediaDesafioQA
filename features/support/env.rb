require 'allure-cucumber'
require 'faker'
require 'httparty'
require 'rspec'
require 'securerandom'


CREDENTIALS = YAML.load_file("features/support/config/credentials.yml")
PAYLOAD_PATH = YAML.load_file("features/support/config/payload_path.yml")
CONFIG_API = YAML.load_file("features/support/config/environment.yml")