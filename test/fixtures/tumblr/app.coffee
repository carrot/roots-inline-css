rootsInlineCss = require '../../..'
tumblr = require 'roots-tumblr'

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [tumblr(), rootsInlineCss()]
