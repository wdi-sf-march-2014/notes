Intro to jQuery
==================

![Good Morning](http://clients.stujophoto.com/photos/i-ZzkJXJf/0/L/i-ZzkJXJf-L.jpg)

[_Good Morning_](http://clients.stujophoto.com/)


#Objectives
* Understand the structure and purpose of jQuery
* Do jQuery Rails Install
* 

#Intro to jQuery
* Easier real-world javascript
* Simplifies common tasks
	* Updating the DOM (HTML)
	* Applying dynamic CSS 
	* Event Handling
	* Animations
	* AJAX
	* Extensible Architecture (plugins)
* _Standard_ ish
* Cross Browser Compatibility

#Install jquery-rails
* [It's already done :)](https://github.com/rails/jquery-rails)
* https://github.com/rails/jquery-rails
* Look at `app/assets/javascripts/application.js`

#Examples

* Image Carousel
* Password Strength
* ToDo / Done



#Simple Example

button to show hide





With jQuery you select (query) HTML elements and perform "actions" on them.

jQuery Syntax
The jQuery syntax is tailor made for selecting HTML elements and performing some action on the element(s).

Basic syntax is: $(selector).action()

A $ sign to define/access jQuery
A (selector) to "query (or find)" HTML elements
A jQuery action() to be performed on the element(s)
Examples:

$(this).hide() - hides the current element.

$("p").hide() - hides all <p> elements.

$(".test").hide() - hides all elements with class="test".

$("#test").hide() - hides the element with id="test".

Note	Are you familiar with CSS selectors?

jQuery uses CSS syntax to select elements. You will learn more about the selector syntax in the next chapter of this tutorial.

The Document Ready Event
You might have noticed that all jQuery methods in our examples, are inside a document ready event:

$(document).ready(function(){

   // jQuery methods go here...

});
This is to prevent any jQuery code from running before the document is finished loading (is ready).

It is good practice to wait for the document to be fully loaded and ready before working with it. This also allows you to have your JavaScript code before the body of your document, in the head section.

Here are some examples of actions that can fail if methods are run before the document is fully loaded:

Trying to hide an element that is not created yet
Trying to get the size of an image that is not loaded yet
Tip: The jQuery team has also created an even shorter method for the document ready event:

$(function(){

   // jQuery methods go here...

});
Use the syntax you prefer. We think that the document ready event is easier to understand when reading the code.


jQuery Selectors
jQuery Events

jQuery Effects
jQuery Hide/Show
jQuery Fade
jQuery Slide
jQuery Animate
jQuery stop()
jQuery Callback
jQuery Chaining

jQuery HTML
jQuery Get
jQuery Set
jQuery Add
jQuery Remove
jQuery CSS Classes
jQuery css()
jQuery Dimensions

jQuery Traversing
jQuery Traversing
jQuery Ancestors
jQuery Descendants
jQuery Siblings
jQuery Filtering