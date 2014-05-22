// http://jsbin.com/xoyuv/1/edit?js,console

var Secreter = function (secret) {
  this._secret = secret;
};

Secreter.prototype = {
  tell_secret: function () {
    return 'Hello! Shhh, but ' + this._secret + "!";
  }
};

var unicorns = new Secreter('I like unicorns');

try {
  console.log(unicorns._secret);
} catch (e) {
  console.log('Error calling my_secret [' + e + ']');
}

console.log(unicorns.tell_secret());


var ponies = new Secreter('I like ponies');

try {
  console.log(ponies._secret);
} catch (e) {
  console.log('Error calling my_secret [' + e + ']');
}

console.log(ponies.tell_secret());


console.log(unicorns.tell_secret());
