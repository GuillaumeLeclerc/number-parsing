# number-parsing 

When you are receiving data from all over the world you might encounter problems while using `parseFloat` or `parseInt`. This library is here to help you handling all locales with one single piece of code.

## Build status

### Master : [![Build Status](https://travis-ci.org/GuillaumeLeclerc/number-parsing.svg?branch=master)](https://travis-ci.org/GuillaumeLeclerc/number-parsing)
### Latest release : [![Build Status](https://travis-ci.org/GuillaumeLeclerc/number-parsing.svg?branch=v0.3.0)](https://travis-ci.org/GuillaumeLeclerc/number-parsing)

## Install

just run `npm install number-parsing`

## Usage

```javascript 
var parser = require("number-parsing");
var a = parser("123'123.99USD"); // will return 123123.99
var b = parser("1234"); // will return 1234
var c = parser("123 123,777") // will return 123123.777
// and so on
```

## Resolve ambiguities
Some notations are ambiguous. For example if you receive '123,123'. You have no clue if it means `123.123` or `123123`. If you are dealing with strange locales which uses `,` as a thousand delimiter, then you might want to specify the affinity of the parser for some locale.
```javascript
var parser = require("number-parsing");
var a = parser("123,123", {
	us : 0.75
	fr  : 0.25
} // will return 123123
var a = parser("123,123", {
	fr : 0.75
	us  : 0.25
} // will return 123.123
```

## Building the tool from sources

Just run `grunt build`

## Run unit tests

Just run `grunt test`


## Contribute

Feel free to add more formats `./formats.coffee` or add new tests (in the directory `test/`)
You can also make suggestion about the main algorithm

## Roadmap 

- Add a way to disable some formats (for example if you are sure you won't use a specific one)
- Add a way to add new formats programmatically (if are parsing a non-standard format)
- Add support for browser (and ad continuous intergration)
