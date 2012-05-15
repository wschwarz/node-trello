rest = require "restler"

class Trello
  constructor: (key, token) ->
    @key = key
    @token = token
    @host = "https://api.trello.com/"

  get: (uri, args, callback) =>
    if arguments.length is 2
      callback = args
      args = {}

    @call "GET", uri, args, callback

  post: (uri, args, callback) =>
    if arguments.length is 2
      callback = args
      args = {}

    @call "POST", uri, args, callback

  put: (uri, args, callback) =>
    if arguments.length is 2
      callback = args
      args = {}

    @call "PUT", uri, args, callback

  call: (method, uri, args, callback) =>
    if arguments.length is 3
      callback = args
      args = {}

    options = 
      method: method
      query: @addAuthArgs args

    url = @host + uri

    @request = rest.request url, options
    @request.on "complete", (result) => 
      if result instanceof Error then callback result, null
      else callback null, result

  addAuthArgs: (args) ->
    args.key = @key
    args.token = @token if @token
    return args

module.exports = Trello