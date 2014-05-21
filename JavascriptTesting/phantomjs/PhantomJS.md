#PhantomJS

PhantomJS is a 'headless browser' we can use for testing and other tasks

##Installation

```
brew update && brew install phantomjs
```

##Running PhantomJS

```
phantomjs
console.log('How Ghostly');
```

##Stopping PhantomJS

Just like your browser, PhantomJS is a event driven system which won't exit until it is told to so, unless your script contains ```phantom.exit();``` it will not stop

You can use [Ctrl-C] now

##Running Javascript

Save the following as ```not_a_browser.js```:

```
console.log('Not a browser');
phantom.exit();
```

Now you can run it

```
$ phantomjs not_a_browser.js 
```

##Screen Captures

Save the following as ```grab_dash.js```:

```
var page = require('webpage').create();
page.open(
    'https://dash.generalassemb.ly/', function() {
    page.render('dash.png');
    phantom.exit();
});
```
##Arguments

Save the following as ```say_hello.js```:

```
var system = require('system');
if (system.args.length === 1) {
  console.log('Usage: say_hello.js <Your Name>');
  phantom.exit();
}
var visitor = system.args[1];
console.log('Hello ' + visitor + '!');
phantom.exit();
```

```
$ phantomjs say_hello.js
$ phantomjs say_hello.js Mary
```

##Running JavaScript Within a Webpage


Save the following as ```page_title.js```:

```
var page = require('webpage').create();
var system = require('system');

if (system.args.length === 1) {
  console.log('Usage: page_title.js <some URL>');
  phantom.exit();
}
var url = system.args[1];

console.log('Loading ' + url);

page.open(url, function (status) {
  console.log('Status: ' + status);

  if (status == 'success') {
    var title = page.evaluate(function () {
      // This code is evaluated in the context of the webpage
      return document.title;
    });
    console.log('Page title is ' + title);
  }
  phantom.exit();
});
```

```
$ phantomjs page_title.js http://www.google.com/
```

#Interacting With a Web Page


Save the following as ```play_senior.js```:

```
// Import webpage
var page = require('webpage').create();

// Open Undergraduate and Change the Select, capturing before and after
page.open('http://jplayground.herokuapp.com/senior', function() {
  page.render('senior_before.png');
  var button_id = page.evaluate(function () {
    // This code is evaluated in the context of the webpage
    var jqObject = $('#senior_slide_toggle');
    jqObject.click();
    return jqObject[0].id;
  });

  console.log('Clicked ' + button_id + '');

  // Wait for the click handlers to fire
  setTimeout(function () {
    //Screen Grab After
    page.render('senior_after.png');
    phantom.exit();
  }, 1000);
});

```

#Experiment

I've made a simple injection script so that you can run arbitrary javascript against any website

**Look at: **samples/run_remote.js


```
	$ cd samples
	$ phantomjs run_remote.js http://www.google.com/ injected_page_title.js
```	

Try creating your own javascript files and running them against a site you are interested in

This also works locally. Say you have a file called ```my_inspector.js``` and you want to run it against your local
rails application:

```
	$ phantomjs run_remote.js http://localhost:3000/ my_inspector.js
```



