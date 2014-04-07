require 'rspec'

RSpec.configure do |config|
  config.mock_framework = :rspec
  RSpec.configuration.color = true
end

def check_class_defined class_name
  class_file = "lib/#{class_name.downcase}.rb"
  describe "#{class_name} class should exist", labStep: "#{class_name} Exists" do
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
  describe "#{class_name} module should exist", labStep: "#{class_name} Exists" do
    it "should be in #{class_file}" do
      expect(Object.const_defined?(class_name)).to(eq(true), "Module #{class_name} should be defined in '#{class_file}'")
      expect(Object.const_get(class_name)).to(be_a(Module), "#{class_name} should be a Module'")
    end
  end
  exists
end


class LabTestProgressState
  def initialize steps
    @name = File.basename(File.dirname(File.dirname(__FILE__)))
    @stepProgress = steps.map.with_index do |label, index|
      {
          label: label,
          open: index == 0
      }
    end
    @currentStep = 0
    puts "======================================================="
    puts "Checking your work for #{@name}"
    puts "======================================================="
    self.load_lab_app_lib_files
    puts "======================================================="
    puts ""
    puts "Review the results of the RSpec tests below to see what"
    puts "you should work on next"
    puts "Always work on the first test to fail first"
    puts ""
    puts "======================================================="

    labTestProgress = self
    RSpec.configure do |config|
      config.around(:each) do |proc|
        labStepNameGroup = proc.metadata[:labStep]
        if labStepNameGroup.nil? || labTestProgress.stepOpen(labStepNameGroup)
          proc.run

          ex = example.instance_variable_get("@exception")

          if ex.nil?
            #success only code goes here
            if labStepNameGroup
              labTestProgress.stepComplete(labStepNameGroup)
            end
          end
        else
          puts "Skipping #{labStepNameGroup}"
        end
      end
    end

  end

  #Require the files the students have written
  def load_lab_app_lib_files
    libFiles = File.dirname(__FILE__) + "/../lib/*.rb"
    Dir[libFiles].each do |file|
      fullpath = File.expand_path(file)
      puts "Loading your file #{fullpath}"
      require fullpath
    end
  end

  def findStep label
    @stepProgress.each.with_index do |step, index|
      return index if step[:label].eql? label
    end
    raise "Unknown Lab Step '#{label}''"
  end


  #set current step if open
  def stepOpen stepLabel
    @currentStep = findStep(stepLabel)
    if @stepProgress[@currentStep][:open]
      true
    else
      #skip tests
      false
    end
  end

  #Open up next step
  def stepComplete stepName
    nextStep = @stepProgress[@currentStep + 1]
    nextStep[:open] = true unless nextStep.nil?
  end

end

LabTestProgress = LabTestProgressState.new [
                                               "Customer Exists",
                                               "Customer Basics",
                                               "Customer Methods",
                                               "Customer Method Implementations",
                                               "Customer Credit Processing",
                                               "Customer Purchases",
                                               "Customer Purchase History",
                                               "OrderProcessor Exists",
                                           ]





