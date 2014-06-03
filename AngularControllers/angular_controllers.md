# Intro To Angular - Controller and Events

## Objectives

* Handle a simple form with an angular controller
* Display repeated data from the controller using a controller method

| Objectives	|
| :----			|
| Students should be able to handle `form` submissions	|
| Students should be able to write controller methods for formating and updating data	|
| Students should able to manage the scoping changes in applicable directives	|


## Simple Form Submission in Angular

Angular controllers help us separate concerns.  We are going to build a hangman app using angular.  Let's start with the following code in [jsbin](http://jsbin.com/).

`index.html`

    <!DOCTYPE html>
    <html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
      <meta charset="utf-8">
      <title>HangMan</title>
    </head>
    <body ng-app>
      <div ng-controller="HangManCtrl">
      </div>
    </body>
    </html>
    
    
`hangman.js`

```
var HangManCtrl = function($scope) {
   $scope.currentWord = "angular";
};
```

Notice that the html has `ng-app` and `ng-controller`.  The `ng-controller` directive binds the div tag to the scope of the controller.  Now angular let's the view have access to the data and methods inside of the controller.  For example, to show the current word, the html would look like this:


    <!DOCTYPE html>
    <html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
      <meta charset="utf-8">
      <title>HangMan</title>
    </head>
    <body ng-app>
      <div ng-controller="HangManCtrl">
         {{currentWord}}
      </div>
    </body>
    </html>
    
Next, let's add a form to hangman so that the user can enter a secret word.  Here are the changes to the html:


    <!DOCTYPE html>
    <html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
      <meta charset="utf-8">
      <title>HangMan</title>
    </head>
    <body ng-app>
      <div ng-controller="HangManCtrl">
        <form ng-submit="addWord()">
          <input type="password" name="newWord" ng-model="newWord" placeholder="Enter A New Word"> <br>
          <button> Add Word</button>
         </form>
      </div>
    </body>
    </html>
    
Two things are new here.  We've added `ng-submit` to the form tag and `ng-model` to the input tag.  The `ng-submit` tells the form which angular method to call on submit.  The `ng-model` tag binds the value of the input tag to `$scope.newWord` in the `HangManCtrl`.

#### Exercise

Make the contoller save the word that the user adds to the input tag.  For now, display the results of adding the word to the screen after the closing form tag.  __NOTE__: Make sure you are displaying data from the controller.

![Angular](angular.png)

#### Solution

`index.html`

    <!DOCTYPE html>
    <html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
      <meta charset="utf-8">
      <title>HangMan</title>
    </head>
    <body ng-app>
      <div ng-controller="HangManCtrl">
        <form ng-submit="addWord()">
          <input type="password" name="newWord" ng-model="newWord" placeholder="Enter A New Word"> <br>
          <button> Add Word</button>
         </form>
         {{currentWord}}
      </div>
    </body>
    </html>


`hangman.js`

```
 var HangManCtrl = function($scope) {
     $scope.currentWord = "angular";
      
     $scope.addWord = function(){
         $scope.currentWord = $scope.newWord;
         $scope.newWord = "";
     };
 };
```

#### Exercise

Add another form and input tag.  The input field should be used to gather guessed characters.  Every time the user clicks `Check Guess`, save the character into an array of guesses in your controller.  Also, get rid of the code to display the secret word!

![Angular](angular.png)


#### Solution

`index.html`

    <!DOCTYPE html>
    <html>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
      <meta charset="utf-8">
      <title>HangMan</title>
    </head>
    <body ng-app>
      <div ng-controller="HangManCtrl">
        <form ng-submit="addWord()">
          <input type="password" name="newWord" ng-model="newWord" placeholder="Enter A New Word"> <br>
          <button> Add Word</button>
         </form>
         
         <form ng-submit="addGuess()">
           <input type="text" ng-model="guess">
           <button>Check Guess</button>
         </form>
         {{guessedChars}}
      </div>
    </body>
    </html>
    
`hangman.js`

```
var HangManCtrl = function($scope) {
    $scope.currentWord = "angular";
    $scope.guessedChars = [];
      
    $scope.addWord = function(){
        $scope.currentWord = $scope.newWord;
        $scope.newWord = "";
    };
   
    $scope.addGuess = function() {
      $scope.guessedChars.push($scope.guess);
      $scope.guess = "";
    }
    
};
```

To make this hangman game a little more user friendly, we only want to add a guess to the array of `guessesedChars` if the guess hasn't been tried already.  Here is the new `HangManCtrl` with an updated addGuess method:

```
var HangManCtrl = function($scope) {
    $scope.currentWord = "angular";
    $scope.guessedChars = [];
      
    $scope.addWord = function(){
        $scope.currentWord = $scope.newWord;
        $scope.newWord = "";
    };
   
    $scope.addGuess = function(){
       if($scope.guessedChars.indexOf($scope.guess) === -1){
          $scope.guessedChars.push($scope.guess);
          $scope.guess = "";
       } 
    };
    
};
```

## Ng-repeat and Controller Methods

Our next task in hangman is to display all the characters that the user has guessed so far.  


* What is a controller?
* `ng-controller`
	* Handling scope - Everything is scoped to a controller
	* data-binding - input field with ng-model (ng-list?) 
		* ng-model
	* Controller events - click events bound to elements
		* forms and sumbissions - ng-submit on form (or ng-model on each input field)
		* directives and scope - ng-repeat to show elements (new scope for each iteration).
			* ng-repeat - Look at [http://jsbin.com/telepufu/1/edit](http://jsbin.com/telepufu/1/edit)
		* click events - add ng-click to things
	* Controller Management
		* Manage models on a page
			* Add, Remove, Update 
			* Format Data