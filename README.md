Deploy Unicorn Apps with Capistrano
===================================

Minimal, annotated configuration files for zero-downtime Capistrano
deployment of a Rack application served by Unicorn over a socket.

Why? See GitHub's ["Unicorn!"][unicorn] and ["Deployment Script Spring
Cleaning"][cleaning] blog posts for additional details.

[unicorn]: https://github.com/blog/517-unicorn
[cleaning]: https://github.com/blog/470-deployment-script-spring-cleaning

The most important files are:

- config/deploy.rb configures Capistrano to start and stop Unicorn
  server processes
- config/unicorn.rb sets a callback to quit Unicorn processes running
  superseded older releases of the codebase and puts pidfiles in the right
  places
- config/deployment_paths.rb ensures Capistrano and Unicorn look for
  important files in the same places
- etc/nginx.conf configures the NGINX server to proxy dynamic page
  requests to the Unicorn socket
