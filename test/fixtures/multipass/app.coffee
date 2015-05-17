rootsInlineCss = require '../../..'

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [rootsInlineCss()]

  locals:
    foo: 'bar'
