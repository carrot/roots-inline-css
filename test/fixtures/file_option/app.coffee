rootsInlineCss = require '../../..'
options = {files: '/public/**.html'}
module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [rootsInlineCss(options)]
