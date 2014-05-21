var system = require('system');

if (system.args.length === 1) {
  console.log('Usage: say_hello.js <Your Name>');
  phantom.exit();
}

var visitor = system.args[1];
console.log('Hello ' + visitor + '!');
phantom.exit();




