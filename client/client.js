const http = require('http');
const grpc = require('grpc');
const url = require('url');

const proto = grpc.load('../search.proto').search;
const client = new proto.Search(
  '127.0.0.1:50051', grpc.credentials.createInsecure());

const app = http.createServer((req, res) => {
  req.query = url.parse(req.url, true).query;

  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json');

  client.search({ q: req.query.q }, (err, response) => {
    res.end(JSON.stringify({ results: response.results }));
  });
});

app.listen(3000, '0.0.0.0', () => {
  console.log(`worker ${process.pid} ready to receive connections`);
});
