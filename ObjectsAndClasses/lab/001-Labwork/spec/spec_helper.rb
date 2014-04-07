require 'rspec'

RSpec.configure do |config|
  config.mock_framework = :rspec
  RSpec.configuration.color = true
end

def check_class_defined class_name
  class_file = "lib/#{class_name.downcase}.rb"
  describe "#{class_name} class should exist in ''#{class_file}''", labStep: "#{class_name} Exists" do
    it "should be in #{class_file}" do
      expect(Object.const_defined?(class_name)).to(eq(true), "Class not defined")
      expect(Object.const_get(class_name)).to(be_a(Class), "Should be a Class'")
    end
  end
  true
end

def check_module_defined class_name
  class_file = "lib/#{class_name.downcase}.rb"
  exists = false
  describe "#{class_name} module should exist in '#{class_file}'", labStep: "#{class_name} Exists" do
    it "should be in #{class_file}" do
      expect(Object.const_defined?(class_name)).to(eq(true), "Class not defined")
      expect(Object.const_get(class_name)).to(be_a(Module), "Should be a Module'")
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

      @stepProgress.each do |step|
        config.before(:all, :labStep => step[:label]) do |example|
          labTestProgress.checkStepStatusBefore(step, example)
        end
        config.after(:all, :labStep => step[:label]) do |example|
          labTestProgress.checkStepStatusAfter(step, example)
        end
      end

      config.after(:each) do |example|
        labTestProgress.afterExample(example)
      end

      config.around(:each) do |proc|
        labStepNameGroup = proc.metadata[:labStep]
        if labStepNameGroup.nil? || labTestProgress.stepOpen(labStepNameGroup)
          proc.run
        else
          labTestProgress.sendOneOffSkipMessage(labStepNameGroup)
        end
      end
    end
  end

  def afterExample(exampleGroup)
    egMethods = exampleGroup.methods
    eMethods = exampleGroup.example.methods
    result = exampleGroup.example.execution_result
    ex = exampleGroup.example.exception
    md = exampleGroup.example.metadata

    ex = exampleGroup.example.instance_variable_get('@exception'.to_sym)
    unless ex.nil?
      @currentStep[:failed] = true
      @currentStep[:open] = false
    end
  end

  def checkStepStatusBefore(step, exampleGroup)
    @currentStep = step
    @currentStep[:failed] = false
  end

  def checkStepStatusAfter(step, exampleGroup)
    if @currentStep[:failed]
    else
      stepComplete(step[:label])
    end
    @currentStep = nil
  end


  #Puts Once
  def sendOneOffSkipMessage stepLabel
    step = findStepIndex(stepLabel)
    unless step.nil?
      unless @stepProgress[step][:skipMessaged]
        puts "\nSaving #{stepLabel} for later on in Lab"
        @stepProgress[step][:skipMessaged] = true
      end
    end
  end

  #Puts Once
  def sendOneOffCompletedMessage step
    unless @stepProgress[step][:completeMessaged]
      puts "\n'#{@stepProgress[step][:label]}' completed!"
      @stepProgress[step][:completeMessaged] = true
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

  def findStepIndex label
    @stepProgress.each.with_index do |step, index|
      return index if step[:label].eql? label
    end
    raise "Unknown Lab Step '#{label}''"
  end


  #set current step if open
  def stepOpen stepLabel
    step = findStepIndex(stepLabel)
    if @stepProgress[step][:open]
      true
    else
      #skip tests
      false
    end
  end

  #Open up next step
  def stepComplete stepLabel
    step = findStepIndex(stepLabel)
    if  @stepProgress[step][:open]
      nextStep = @stepProgress[step + 1]
      unless nextStep.nil?
        nextStep[:open] = true
      end
      sendOneOffCompletedMessage step
    end
  end

end

LabTestProgress = LabTestProgressState.new [
                                               "Customer Exists",
                                               "Customer Basics",
                                               "Customer Data",
                                               "Customer Methods",
                                               "Customer Method Implementations",
                                               "Customer Credit Processing",
                                               "Customer Purchases",
                                               "Store Purchase History",
                                               "Customer Purchase History",
                                               "Generate Purchase History",
                                               "OrderProcessor Exists",
                                               "OrderProcessor Process"
                                           ]





