All this week, we're focusing on single page application development.

>A single-page application, also known as single-page interface, is a web application or web site that fits on a single web page with the goal of providing a more fluid user experience akin to a desktop application.

The core concept behind a Single Page Application is that the browser only uses one URL. That means you can bounce around the site, fill out forms, or conduct any normal activity without the location in your browser's address bar ever changing. It's a simple thing from the user's perspective, but it has big implications for the programmer.



**Here are some examples of Single Page Apps**

* [How Much To Make An App](http://howmuchtomakeanapp.com/)
* [Awesome Overview of European Soccer Transfer Window](http://transferwindow.info/)
* [Make Your Money Matter](http://makeyourmoneymatter.org/)
* [NBA Stats](http://nballstats.com/)
* [Spotify Year In Review](https://www.spotify.com/us/2013/)


***


The following is excerpted from [this article](http://www.seguetech.com/blog/2013/04/18/what-is-single-page-application)

##What's Good About Single Page Apps?

SPAs have two main benefits for users. The first benefit is removing that jarring page change when you click on a link. In an SPA, the navigation controls and main interface typically stay on the page when you click a link; only the piece of content you want changed actually gets changed. The second benefit is the basic speed boost you get from a lighter server response payload for the chunk of content versus a whole page. The lighter payload transmits across the network more quickly and the browser can incorporate the new piece of content more quickly than redrawing an entirely new page.

##What Isn't Good About Single Page Apps?

There are definitely some special considerations to take into account with SPAs. Creating an SPA without sound object-oriented principles can lead to memory leaks within the browser which can cause it to slow down or crash. If you use an SPA for your main site, you have to take special steps for search engine optimization (SEO) so that crawlers will see an appropriate version of your page. The biggest bane of SPAs is the browser back button. If not properly handled, the user can click the back button intending to go back one step in their workflow, but instead be dumped back to whatever page they were at before they entered the SPA. However, all of these issues can be addressed with the right techniques.


## So Colt, Where Do We Start?!

Learning to build single page apps is a multistep process. Today, we're going to focus on creating the front-end components of a single page app.  We'll learn how to make the front end components interact with our back-end later in the week.

##Objectives



Today's lecture is going to make heavy use of jQuery.  Refer back to the excellent [jQuery documentation](http://api.jquery.com/) as needed.

Here are some of the jQuery methods we'll be using in today's lecture and lab:
* .ready()
* .append()
* .prepend()
* .remove()
* .keypress()
* .val()
* .on()
* .click
* .hasClass()
* .removeClass()
* .addClass()
* .fadeOut()
* .each()


##Direct and Delegated Events



[jQuery keypress() event](http://api.jquery.com/keypress)

[ASCII Character Codes](http://www.asciitable.com/)

We can use the keypress() event to trigger events when a key pressed in a text input.

```js
$( "#target" ).keypress(function() {
  console.log( "Handler for .keypress() called." );
});
```

If we only care about specific keys and don't want the event to trigger every time the user presses a key, we need to make use of [ASCII Character Codes](http://www.asciitable.com/)

Here's an example:

```js
$( "#target" ).keypress(function( event ) {
  if ( event.which == 13 ) {
    alert("You pressed enter!");
  }
});
```
[jQuery's On() Method](http://api.jquery.com/on/) allows us to attach an event handler function for one or more events to the selected elements

The following code will alert "You clicked an LI!" whenever we click on any `<li></li>` on the page.

```js
$( "li" ).on( "click", function() {
  alert("You clicked an LI!");
});
```

**However, the above code will only work on `<li></li>`'s that exist at the time the code is run.**

How can we attach listeners to elements that don't exist at the time our page loads?

**Event Propagation**

>browser events bubble, or propagate, from the deepest, innermost element (the event target) in the document where they occur all the way up to the body and the document element.

We can use **delegated events** to add listeners to elements that don't exist yet.   By picking an element that is guaranteed to be present at the time the delegated event handler is attached, we can use delegated events to avoid the need to frequently attach and remove event handlers.

In the following example, we attach an event handler to a `<ul></ul>`.  The event bubbles up from the clicked `<li></li>` to the `<ul></ul>`

```js
$( "ul" ).on( "click", "li" function() {
  alert("You clicked an LI!");
});
```
Using delegated events allows us to add event listeners to things that don't exist on the page yet.





Here's the [boilerplate for today's app](http://cdpn.io/yqzAL)

After my lecture, I'll post the link to my completed solution.