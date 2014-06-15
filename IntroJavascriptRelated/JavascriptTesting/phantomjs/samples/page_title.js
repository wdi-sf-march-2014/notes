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

