rootsInlineCss = require '../../..'
options = {files: '**/*.html'}

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [rootsInlineCss(options)]
