c = console.log.bind console
_ = require 'lodash'
express = require 'express'
app = express()
body_parser = require 'body-parser'
path = require 'path'
public_dir = path.resolve(__dirname, '../public')

if process.env.NODE_ENV is 'production' # Heroku sets this automatically, so it's a good test for if we're running under Heroku prod
    index = '/prod_index.html'
else
    index = '/dev_index.html'

app.use '/js', express.static(path.join(public_dir, '/js'))
app.use '/css', express.static(path.join(public_dir, '/css'))
app.use '/images', express.static(path.join(public_dir, '/images'))
app.use '/svgs', express.static(path.join(public_dir, '/svgs'))
app.all '/*', (req, res, next) ->
    res.sendFile path.join(public_dir, index)
app.use(express.static(public_dir))

if process.env.PORT # Heroku condition
    port = process.env.PORT
else if process.env.NODE_ENV is 'production'
    port = 3332
else
    port = 3331

app.listen port, ->
    c 'server listening on port:', port
