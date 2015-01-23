zlib = require 'zlib'
fs = require 'fs'
split = require './split'
ts = require './timestamp'
dumpz = require './dumpz'
parts =

for k, v of require './parts'
  fs.createReadStream "src/#{k}_#{ts}.gz"
  .pipe zlib.createUnzip()
  .pipe split (arr)->
    @queue arr
  .pipe dumpz()
  .pipe fs.createWriteStream "src/#{k}"