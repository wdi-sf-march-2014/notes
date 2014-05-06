#Testing Javascript With Jasmine

###Objectives


###General Resources


###What is Behavioral Driven Development
- Some practices of BDD:
  - Establishing the goals of different stakeholders required for a vision to be implemented
  - Involving stakeholders in the implementation process through outside-in software development
  - Using examples to describe the behavior of the application, or of units of code
  - Automating those examples to provide quick feedback and regression testing- 

###Learning the Syntax
- Jasmine takes a lot of cues from RSpec 
- A test suite begins with describe, with two parameters:
  - A string giving the test suite a name
  - An anonymous function that implements the test suite  
  

  ```
  describe('Javascript addition operator', function)() {
    it ('adds two numbers together, function () {
      expect(1 +2).toEqual(3);
    });
  });
  ```

###Setting up a Project
- ```spec``` folder is where the tests reside
- ```src``` folder is where the Javascript code resides
- The SpecRunner.html file is what runs the tests in a browser

###Matchers

[Jasmine Matchers](https://github.com/pivotal/jasmine/wiki/Matchers)


###Lab Time
