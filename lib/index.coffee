path      = require 'path'
fs        = require 'fs'
Promise   = require 'bluebird'
inlineCss = require 'inline-css'
RootsUtil = require 'roots-util'

module.exports = (opts) ->
  opts ||= {}

  class RootsInlineCss

    constructor: (@roots) ->
      @files     = []
      util      = new RootsUtil(@roots)
      @filesnames = if opts.files then util.files(opts.files).map((f) -> path.join(roots.root,f.relative)) else []

    compile_hooks: ->
      category = 'inline-css'

      write: (ctx) =>
        if path.extname(ctx.file_options._path) == '.html' and opts.files == undefined
          @files.push(ctx)
          return false
        else if ctx.file_options.filename in @filesnames
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
