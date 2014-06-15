// Import webpage
var page = require('webpage').create();

// Open Dash and pass in a callback to do a screen grab
page.open('https://dash.generalassemb.ly/', function() {
  page.render('dash.png');
  phantom.exit();
});
