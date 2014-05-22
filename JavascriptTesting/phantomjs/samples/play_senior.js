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

