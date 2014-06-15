// http://jsbin.com/vubak/1/edit?js,console

var Secreter = {

  _secret: 'Nothing',

  set_secret: function(secret)
  {
    _secret = secret;
  },

  my_secret: function() {
    return _secret;
  },

  tell_secret: function () {
    return 'Hello! Shhh, but ' + this.my_secret() + "!";
  }
};


var unicorns = Secreter;
unicorns.set_secret('I like unicorns');
console.log(unicorns.tell_secret());

var ponies = Secreter;
ponies.set_secret('I like ponies');
console.log(ponies.tell_secret());

// Double Check Unicorns
console.log(unicorns.tell_secret()); //Ooops!!!! We only have one :(
