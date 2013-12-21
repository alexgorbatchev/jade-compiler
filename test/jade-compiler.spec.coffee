require 'coffee-errors'

chai    = require 'chai'
fibrous = require 'fibrous'

# explicitly use compiled version
jade   = require '../jade-compiler.js'
expect = chai.expect

SOURCE = """
!!!
html
  title Hello World
"""

describe 'jade-compiler', ->
  describe '::fromSource', ->
    it 'compiles', fibrous ->
      expect(jade.sync.fromSource SOURCE).to.eql '<!DOCTYPE html><html><title>Hello World</title></html>'

    it 'compiles with options', fibrous ->
      expect(jade.sync.fromSource SOURCE, pretty: yes).to.eql """
        <!DOCTYPE html>
        <html>
          <title>Hello World</title>
        </html>
      """

    it 'compiles with errors', fibrous ->
      expect(-> jade.sync.fromSource 'html: ----').to.throw

  describe '::fromFile', ->
    it 'compiles', fibrous ->
      expect(jade.sync.fromFile "#{__dirname}/fixture.jade").to.eql '<!DOCTYPE html><html><title>Hello World</title></html>'

    it 'compiles with options', fibrous ->
      expect(jade.sync.fromFile "#{__dirname}/fixture.jade", pretty: yes).to.eql """
        <!DOCTYPE html>
        <html>
          <title>Hello World</title>
        </html>
      """
