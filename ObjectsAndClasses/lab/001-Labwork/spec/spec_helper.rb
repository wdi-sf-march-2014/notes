require 'rspec'

RSpec.configure do |config|
  config.mock_framework = :rspec
end

def check_class_defined class_name
  class_file = "lib/#{class_name.downcase}.rb"
  describe "#{class_name} class should exist" do
    it "should be in #{class_file}" do
      expect(Object.const_defined?(class_name)).to(eq(true), "Class #{class_name} should be defined in '#{class_file}'")
      expect(Object.const_get(class_name)).to(be_a(Class), "#{class_name} should be a Class'")
    end
  end
  true
end

def check_module_defined class_name
  class_file = "lib/#{class_name.downcase}.rb"
  exists = false
  describe "#{class_name} module should exist" do
    it "should be in #{class_file}" do
      expect(Object.const_defined?(class_name)).to(eq(true), "Module #{class_name} should be defined in '#{class_file}'")
      expect(Object.const_get(class_name)).to(be_a(Module), "#{class_name} should be a Module'")
    end
  end
  exists
end

#Require the files the students have written
def load_lab_app_lib_files
  libFiles = File.dirname(__FILE__) + "/../lib/*.rb"
  Dir[libFiles].each {|file| require file}
end

load_lab_app_lib_files



