rootsInlineCss = require '../../..'
options = {file: '/path/**.html', applyStyleTags:false}
module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [rootsInlineCss(options)]
