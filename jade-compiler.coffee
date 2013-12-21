fs   = require 'fs'
jade = require 'jade'

module.exports = compiler =
  fromSource: (src, opts..., callback) ->
    opts          = opts[0] or {}
    opts.filename = opts.filename or 'jade-compiler'

    try
      callback null, jade.render src, opts
    catch err
      callback err

  fromFile: (filepath, opts..., callback) ->
    opts           = opts[0] or {}
    opts.filename ?= filepath

    fs.readFile filepath, 'utf8', (err, src) ->
      return callback err if err?
      compiler.fromSource src, opts, callback
