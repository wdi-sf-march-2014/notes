##Exercise #1: The Fortune Teller
- Store the following into variables: number of children, partner's name, geographic location, job title.
- Output your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."

```
function tellFortune(jobTitle, location, partner, numKids) {
    var future = 'You will be a ' + jobTitle + ' in ' + location + ' and married to ' +
   partner + ' ' + ' with ' + numKids + ' kids.';
    console.log(future);
}

tellFortune('bball player', 'spain', 'Shaq', 3);
tellFortune('stunt double', 'Japan', 'Ryan Gosling', 3000);
tellFortune('Elvis impersonator', 'Russia', 'The Oatmeal', 0);
```

##Exercise #2: The World Translator
- Write a function named helloWorld that:
    - takes 1 argument, a language code (e.g. "es", "de", "en")
    - returns "Hello, World" for the given language, for atleast 3 languages. It should default to returning English.
    - Call that function for each of the supported languages and log the result to make sure it works.

``` 
function helloWorld(lang) {
    if (lang == 'fr') {
        return 'Bonjour tout le monde';
    } else if (lang == 'es') {
        return 'Hola, Mundo';
    } else {
        return 'Hello, World';
    }
}

console.log(helloWorld('en'));
console.log(helloWorld('fr'));
console.log(helloWorld('es'));
```

##Exercise #3
- Write a for loop that will iterate from 0 to 20. For each iteration, it will check if the current number is even or odd, and report that to the screen (e.g. "2 is even").

```
for (var i = 0; i <= 20; i++) {
    if (i % 2 === 0) {
        console.log(i + ' is even');
    } else {
        console.log(i + ' is odd');
    }
}
```