rest = require "restless"
querystring = require "querystring"
OAuth = require "./trello-oauth"

class Trello
  # Creates a new Trello request wrapper.
  # Syntax: new Trello(applicationApiKey, userToken)
  constructor: (key, token) ->
    throw new Error "Application API key is required" unless key?

    rest.service
      baseUrl: "https://api.trello.com"
      fixedQuery:
        key: key
        token: token

Trello.OAuth = OAuth
module.exports = Trello