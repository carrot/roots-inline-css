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
  h.project.remove_folders('**/public')

describe 'roots compile with inline-css', ->

  before (done) -> compile_fixture.call(@, 'basic', done)

  it 'compiles basic project', (done) ->
    p = path.join(@public, 'index.html')
    p.should.be.a.file()
    fs.existsSync(p).should.be.ok
    contents = fs.readFileSync(p, 'utf8')
    contents.should.match /<p style="color: red; text-decoration: underline;">/
    done()

describe 'inline-css tested with options', ->

  before (done) -> compile_fixture.call(@, 'options', done)

  it 'compiles project with options', (done) ->
    p = path.join(@public, 'index.html')
    p.should.be.a.file()
    fs.existsSync(p).should.be.ok
    contents = fs.readFileSync(p, 'utf8')
    contents.should.match /<body style="background: blue;"><p style="text-decoration: underline;">/
    done()

describe 'inline-css tested with the file option', ->

  before (done) -> compile_fixture.call(@, 'file_option', done)

  it 'compiles project with the file option', (done) ->
    test = path.join(@public,'test.html')
    test.should.be.a.file()
    fs.existsSync(test).should.be.ok
    contents = fs.readFileSync(test, 'utf8')
    contents.should.match /color: red; text-decoration: underline;/
    done()

  it 'compiles other files that should be matched',(done) ->
    kittens = path.join(@public,'kittens.html')
    kittens.should.be.a.file()
    fs.existsSync(kittens).should.be.ok
    contents = fs.readFileSync(kittens, 'utf8')
    contents.should.match /color: red; text-decoration: underline;">Kittens/
    done()

  it 'will not inline files not included', (done) ->
    p = path.join(@public,'index.html')
    p.should.be.a.file()
    fs.existsSync(p).should.be.ok
    contents = fs.readFileSync(p, 'utf8')
    contents.should.match /{ color: red; }/
    done()
