var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello World!");
  console.log('write message to stdout');
  process.stderr.write('write message to stderr');
}
var www = http.createServer(handleRequest);
www.listen(8080);

