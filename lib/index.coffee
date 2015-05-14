path      = require 'path'
fs        = require 'fs'
Promise   = require 'bluebird'
inlineCss = require 'inline-css'
RootsUtil = require 'roots-util'
_         = require 'lodash'

module.exports = (opts) ->
  opts ||= {}
  opts = _.defaults opts,
    files: []
    applyStyleTags: true


  class RootsInlineCss

    constructor: (@roots) ->
      @files = []
      @util = new RootsUtil(@roots)

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
            opts.url ||= 'file://' + tgt
            inlineCss(file.content, opts)
            .then (html) -> fs.writeFile(tgt, html)
