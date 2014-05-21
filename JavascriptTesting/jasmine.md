#Testing Javascript With Jasmine


###What is Behavioral Driven Development
- 
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

###Spec Runner
- Jasmine can run your tests within a web browser by using a spec runner HTML file. The spec runner is a simple HTML page that links the necessary JavaScript and CSS files for both Jasmine and your code.
- The spec runner loads the necessary Jasmine files first.
- ```jasmine.js``` contains the testing framework
- ```jasmine-html.js``` contains the reporter, which will run the javascript
- ```jasmine.css``` formats the test results

###Running the Tests
- To run our tests, simply open SpecRunner.html in a web browser. 


###Matchers

[Jasmine Matchers](https://github.com/pivotal/jasmine/wiki/Matchers)

  Common, built-in Matchers:
  
```
    expect(x).toEqual(y); compares objects or primitives x and y and passes if they are equivalent
    
    expect(x).toBe(y); compares objects or primitives x and y and passes if they are the same object
    
    expect(x).toMatch(pattern); compares x to string or regular expression pattern and passes if they match
    
    expect(x).toBeDefined(); passes if x is not undefined
    
    expect(x).toBeUndefined(); passes if x is undefined
    
    expect(x).toBeNull(); passes if x is null
    
    expect(x).toBeTruthy(); passes if x evaluates to true
    
    expect(x).toBeFalsy(); passes if x evaluates to false
    
    expect(x).toContain(y); passes if array or string x contains y
    
    expect(x).toBeLessThan(y); passes if x is less than y
    
    expect(x).toBeGreaterThan(y); passes if x is greater than y
    
    expect(function(){fn();}).toThrow(e); passes if function fn throws exception e when executed
```

###JSHint
- [JSHint](http://www.jshint.com/)
- a tool that helps to detect errors and potential problems in your JavaScript code.

