rootsInlineCss = require '../../..'
options = {applyStyleTags:false, extraCss:"body{background: blue}"}

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [rootsInlineCss(options)]
