var page = require('webpage').create();
var system = require('system');
var fs = require('fs');


if (system.args.length === 1) {
  console.log('Usage: run_remote.js <some URL> <some JS File>');
  phantom.exit();
}

var url = system.args[1];
var js_file = system.args[2];

if (fs.exists(js_file)) {

  console.log('Loading ' + url);

  page.open(url, function (status) {

    console.log('Status: ' + status);

    if (status == 'success') {

      // Redirect Page Logs
      page.onConsoleMessage = function (msg) {
        console.log(msg);
      };

      // Rediret Page Alerts
      page.onAlert = function (msg) {
        console.log(msg);
      };

      // Wait for any handlers to fire
      setTimeout(function () {

        console.log('Creating Before Screen Grab in run_remote_before.png');
        page.render('run_remote_before.png');

        console.log('Injecting ' + js_file);
        page.injectJs(js_file);

        // Wait for any handlers to fire
        setTimeout(function () {
          //Screen Grab After
          console.log('Creating After Screen Grab in run_remote_after.png');
          page.render('run_remote_after.png');
          phantom.exit();
        }, 1000);
      }, 1000);

    }
    else {
      phantom.exit();
    }
  });
}
else {
  console.log(js_file + " not found");
  phantom.exit();
}


