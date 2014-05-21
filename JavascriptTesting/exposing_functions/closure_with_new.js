// http://jsbin.com/cefur/1/edit?js,console

var Secreter = function (secret) {
  function my_secret() {
    return secret;
  }

  this.tell_secret = function () {
    return 'Hello! Shhh, but ' + my_secret() + "!";
  };
};


var unicorns = new Secreter('I like unicorns');

try {
  console.log(unicorns.my_secret());
} catch (e) {
  console.log('Error calling my_secret [' + e + ']');
}

console.log(unicorns.tell_secret());


var ponies = new Secreter('I like ponies');

try {
  console.log(ponies.my_secret());
} catch (e) {
  console.log('Error calling my_secret [' + e + ']');
}

console.log(ponies.tell_secret());

// Double Check Unicorns
console.log(unicorns.tell_secret());
