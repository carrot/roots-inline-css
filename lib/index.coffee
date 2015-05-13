RootsUtil = require 'roots-util'
path      = require 'path'
fs        = require 'fs'
inlineCss = require 'inline-css'

module.exports = ->
  class RootsInlineCss

    constructor: (@roots) ->
      @category = 'inline-css'
      @files = []

    fs: ->
      extract: true
      detect: (f) -> true

    compile_hooks: ->
      after_pass: (ctx) =>
        file = ctx.file.file_options.filename
        ext = path.extname(ctx.file.file_options._path)
        tgt = path.join(@roots.root, @roots.config.output,
          ctx.file.file_options._path)
        @files.push(tgt) if ext == '.html'

    category_hooks: ->
      after: (ctx) =>
        options = {}
        for file in @files
          options.url = 'file://' + file
          html = fs.readFileSync(file, 'utf8')
          # does the job but not properly because it needs to return a promise
          inlineCss(html, options, (err, html) -> fs.writeFileSync(file, html))
