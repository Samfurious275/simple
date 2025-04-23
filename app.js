// Import the built-in 'http' module to create a server
const http = require('http');

// Define the hostname and port for the server
const hostname = '127.0.0.1'; // Localhost
const port = 3000; // Port number

// Create the server
const server = http.createServer((req, res) => {
  // Set the response HTTP headers
  res.statusCode = 200; // HTTP status code (OK)
  res.setHeader('Content-Type', 'text/plain'); // Content type

  // Send the response body
  res.end('Hello, World!\n');
});

// Start the server and listen on the specified port and hostname
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
