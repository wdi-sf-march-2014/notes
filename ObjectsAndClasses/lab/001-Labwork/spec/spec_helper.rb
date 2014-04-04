RSpec.configure do |config|
  config.mock_framework = :rspec
end

def check_class_defined class_name
  Object.const_defined?(class_name)
end

#Require the files the students have written
Dir["../lib/*.rb"].each {|file| require file }
