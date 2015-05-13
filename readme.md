# roots-inline-css

[![npm](https://badge.fury.io/js/roots-inline-css.svg?style=flat)](http://badge.fury.io/js/roots-inline-css) [![tests](https://badge.fury.io/travis/carrot/roots-inline-css/master.svg?style=flat)](https://travis-ci.org/carrot/roots-inline-css) [![dependencies](https://badge.fury.io/gemnasium/carrot/roots-inline-css.svg?style=flat)](https://gemnasium.com/carrot/roots-inline-css) [![Coverage Status](https://img.shields.io/coveralls/carrot/roots-inline-css.svg?style=flat)](https://coveralls.io/r/carrot/roots-inline-css?branch=master)

a roots extension for inlining your CSS properties into the style attribute in an html file

> **Note:** This project is in early development, and versioning is a little different. [Read this](http://markup.im/#q4_cRZ1Q) for more details.

### Installation

- make sure you are in your roots project directory
- `npm install roots-inline-css --save`
- modify your `app.coffee` file to include the extension, as such

  ```coffee
  rootsInlineCss = require('roots-inline-css')

  module.exports =
    extensions: [rootsInlineCss()]
  ```

### Usage


### License & Contributing

- Details on the license [can be found here](LICENSE.md)
- Details on running tests and contributing [can be found here](contributing.md)
