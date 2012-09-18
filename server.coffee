# Load the http module to create an http server.
http = require("http")

# Configure our HTTP server to respond with request headers back to all requests.
server = http.createServer (request, response) ->
  response.writeHead 200,
    "Content-Type": "text/plain"
  response_object =
    headers: request.headers
    httpVersion: request.httpVersion
    method: request.method
    url: request.url
  response.end JSON.stringify response_object

# Listen on port 8000, IP defaults to 127.0.0.1
port = process.env.PORT || 8000
server.listen port

# Put a friendly message on the terminal
console.log "Server running at port "+port
