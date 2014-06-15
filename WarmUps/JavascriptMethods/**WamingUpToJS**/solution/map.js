
var each = function(list, action){
  for( var i = 0; i < list.length; i++){
    var item = list[i];
    action(item, i, list);
  }
  return list;
};


var map = function(list, action) {
  var result = [];
  each(list, function(item, index, list){
    result.push(action(item, index, list));
  });

  return result;
};


var double = function(item){
  return item * 2;
};

var minusOne = function(item){
  return item - 1;
};

var myArr = [1,2,3];

// Say we were calling map twice
var dblMyArr = map(myArr, double);
var minusOneArr = map(dblMyArr, minusOne);

// We could refactor it into just one 
//   call as follows
var myResult = map(myArr, function(item){
  return minusOne(double(item));
});

console.log(minusOneArr, " Should equal ", myResult);
