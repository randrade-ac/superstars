require 'watir-webdriver'
require 'page-object'
require 'rspec'
require 'active_record'
require 'data_magic'

World(PageObject::PageFactory)
World(RSpec::Matchers)
DataMagic.yml_directory = 'config/data'