Deploy Unicorn Apps with Capistrano
===================================

Minimal, annotated configuration files for zero-downtime
[Capistrano][capistrano] deployment of a [Rack][rack] application
served by [Unicorn][unicorn]. Why? See GitHub's ["Unicorn!"][unicorn]
and ["Deployment Script Spring Cleaning"][cleaning] blog posts.

[capistrano]: http://capify.org
[rack]: http://rack.github.io
[unicorn]: http://unicorn.bogomips.org
[unicorn]: https://github.com/blog/517-unicorn
[cleaning]: https://github.com/blog/470-deployment-script-spring-cleaning

The most important files:

- `config/deploy.rb` configures Capistrano to start and stop Unicorn
  master processes

- `config/unicorn.rb` puts pidfiles in the right places and sets a
  callback to QUIT Unicorn master processes running older releases of the
  codebase

- `config/deployment_paths.rb` ensures Capistrano and Unicorn look for
  important files in the same places
  
- `etc/nginx.conf` configures the [NGINX][nginx] server to proxy through
  the Unicorn socket for dynamic page requests

[nginx]: http://www.nginx.org
