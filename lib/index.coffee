path      = require 'path'
fs        = require 'fs'
Promise   = require 'bluebird'
inlineCss = require 'inline-css'
_         = require 'lodash'

module.exports = (opts) ->

  opts = _.defaults opts,
    files: []
    applyStyleTags: true

  class RootsInlineCss

    constructor: (@roots) ->
      @files = []

    compile_hooks: ->
      category = 'inline-css'

      write: (ctx) =>
        if path.extname(ctx.file_options._path) == '.html'
          @files.push(ctx)
          return false
        else
          return true

    category_hooks: ->
      after: (ctx, category) =>
        if category == 'compiled'
          Promise.map @files, (file) =>
            tgt = path.join(@roots.root, @roots.config.output,
              file.file_options._path)
            inlineCss(file.content, {url: 'file://' + tgt})
            .then (html) -> fs.writeFile(tgt, html)
