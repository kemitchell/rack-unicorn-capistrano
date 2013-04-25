require 'bundler/capistrano'

set :application, 'rack-unicorn-capistrano'

set :user, 'deployer'
set :group, 'www-data'
set :use_sudo, false

# Permits local SSH keys on the deploying machine to be used for git
# fetches on the server.
set :ssh_options, { :forward_agent => true }

set :scm, :git
set :repository, 'git://github.com/kemitchell/rack-unicorn-capistrano.git'
set :branch, 'master'

# specify the server address like so:
# $ WEB_SERVER=10.10.10.1 cap deploy
server ENV['WEB_SERVER'], :app, :web, :db, :primary => true

require './config/deployment_paths.rb'
set :deploy_to, DEPLOY_TO

after 'deploy:restart', 'deploy:cleanup'

namespace :deploy do
  task :restart do
    # Signals the Unicorn server to start a new master process, loading
    # the new release of the codebase. Unicorn will suffix the pid file
    # for the old server process with ".oldbin".
    #
    # As the new processes start up, calls back to before_fork (in
    # config/unicorn.conf) will read the .oldbin pid file and signal the
    # old process to shut down.
    run "kill -s USR2 `cat #{UNICORN_PID}`"
  end

  task :start do
    # Start production Unicorn as a daemon with configuration.
    run <<-COMMAND.gsub(/\s+/, ' ')
      cd #{current_path} ;
      bundle exec unicorn
        --env production
        --config-file config/unicorn.rb
        --daemonize
    COMMAND
  end

  task :stop do
    # Shut down the Unicorn server.
    run "kill -s QUIT `cat #{UNICORN_PID}`"
  end
end
