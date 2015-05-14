path  = require 'path'
Roots = require 'roots'
fs    = require 'fs'

compile_fixture = (fixture_name, done) ->
  @public = path.join(_path, fixture_name, 'public')
  h.project.compile(Roots, fixture_name).then(-> done())

before (done) ->
  h.project.remove_folders('**/public')
  h.project.install_dependencies('*', done)

after ->
  # h.project.remove_folders('**/public')

describe 'roots compile with inline-css', ->

  before (done) -> compile_fixture.call(@, 'basic', done)

  it 'compiles basic project', (done) ->
    p = path.join(@public, 'index.html')
    p.should.be.a.file()
    fs.existsSync(p).should.be.ok
    contents = fs.readFileSync(p, 'utf8')
    contents.should.match /<p style="color: red; text-decoration: underline;">/
    done()

describe 'roots compiled with options', ->

  before (done) -> compile_fixture.call(@, 'options', done)

  it 'compiles project with options', (done) ->
    p = path.join(@public, 'index.html')
    p.should.be.a.file()
    fs.existsSync(p).should.be.ok
    contents = fs.readFileSync(p, 'utf8')
    contents.should.match /<p style="text-decoration: underline;">/
    done()
