#Angular Services, Factories, and ngResource

###What are Services?

*For memory and performance purposes, controllers are instantiated only when they are needed and discarded when they are not. That means that every time we switch a route or reload a view, the current controller gets cleaned up by Angular.*  

*Services Provide a method for us to keep data around for the lifetime of the app and communicate across controllers in a consistent manner.*  

*Services are Singleton objects that are instantiated only once per app (by the $injector) and lazy-load (created only when necessary). They provide an interface to keep together those methods that relate to a specific function.* - Ari Lerner  

There are 5 different methods for creating services:

1. factory()
2. service()
3. constant()
4. value()
5. provider()

**Service:** is used to create a constructor function. When a service is passed, it creates a new instance of service.  

**Constant:** allows us to set an existing value as a constant, and inject this into other parts of our app as a service. An example is we could use a constant to set an api key.  

**Value:** is similar to constant except it cannot be injected into a config function.  

**Provider:** accomplishes many of the same things as factory(), but is used when extra configuration is needed.  

An Additional Tutorial: http://viralpatel.net/blogs/angularjs-service-factory-tutorial/  
And more on the differences between all of these: http://iffycan.blogspot.com/2013/05/angular-service-or-factory.html  

###What is a Factory?

*When you’re using a Factory you create an object, add properties to it, then return that same object. When you pass this service into your controller, those properties on the object will now be available in that controller through your factory.* - http://tylermcginnis.com/angularjs-factory-vs-service-vs-provider/  

A factory differs from using `.service()` because it is passing a function reference into a controller, as opposed to a new instance.  

###Why are Factories Important?

We use **factories** in Angular to properly seperate concerns. Controllers are concerned with binding model data to views using $scope. It is not their job to worry about fetching and manipulation data.  

Furthermore, **factories** are a Singleton object, and therefore can be used to keep certain data consitent across all controllers.  

###Code Along

Creating a factory  

**books.js**  
```javascript
BookApp.factory('BookFactory', function() {
  var bookFactory = {};

  return bookFactory;
}
```

Giving our controller access to our factory.  

```javascript
BookApp.controller('BookController', [ '$scope', '$http', 'BookFactory', 
function ($scope, $http, BookFactory) {
  // .
  // .
  // .
}
```  

Moving book - list logic  

**before**  
```javascript
$scope.books = [];
$http.get("/books.json").success((data)-> $scope.books = data);
```

**after**  

*service*  
```javascript
bookFactory.getBooks = function () {
    return $http.get('/books.json');
  };
```
*controller*  
```javascript
$scope.books;
    getBooks();

    function getBooks() {
      BookService.getBooks().success(function(data) {
        $scope.books = data;
      });
    }
```

Moving create logic  

**before**  

```javascript
 $scope.addBook = function() {
    $http.post("/books.json", $scope.newBook).success(function(data) {
      $scope.books.push(data);
    });
   $scope.newBook = {};
  }
```

**after**  

*factory*

```javascript
bookFactory.insertBook = function (book) {
    return $http.post('books.json', book);
  };
```

*controller*
```javascript
$scope.addBook = function () {
  BookFactory.insertBook($scope.newBook).success(function(data){
    $scope.books.push(data);
  });
  $scope.newBook = {};
}
```  

###Exercise

Move delete, and update logic to the factory.  

##ngResource

###What is $resource?

"A factory which creates a resource object that lets you interact with RESTful server-side data sources." - https://docs.angularjs.org/api/ngResource/service/$resource

###Code Along

Adding Resource
  - First ensure you have proper angular-resource.min.js file

```javascript
var BookApp = angular.module('app', ['ngResource']);
```

Using `$resource in factory`  

*factories*  
```javascript
BookApp.factory('BooksFactory', function($resource) {
  return $resource('/books.json', {}, {
    query: { method: 'GET', isArray: true },
    create: { method: 'POST' }
  });
});

BookApp.factory('BookFactory', function($resource) {
  return $resource('/books/:id.json', {}, {
    show: { method: 'GET', params: {id: '@id'} },
    update: { method: 'PUT', params: {id: '@id'} },
    delete: { method: 'DELETE', params: {id: '@id'} }
  });
});
```

*controller*  
```javascript
BookApp.controller('BookController', [ '$scope', 'BooksFactory', 'BookFactory', '$location',
  function ($scope, BooksFactory, BookFactory, $location) {
    $scope.books = BooksFactory.query();

    $scope.saveBook = function () {
      BooksFactory.create($scope.newBook);
      $scope.books = BooksFactory.query();
      $scope.newBook = {};
    }

    $scope.delete = function (id) {
      BookFactory.delete({id: id});
      $scope.books = BookFactory.query();
    }

}]);
```
###Exercise

Add edit functionality.  
Bonus Challenge: Add show functionality.  

Resource to help with show: http://draptik.github.io/blog/2013/07/28/restful-crud-with-angularjs/  
