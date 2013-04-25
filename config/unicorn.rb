require './config/deployment_paths.rb'

# Preload application code before forking worker processes.
preload_app true
worker_processes 4

timeout 30

# Location of the socket, to appear in an NGINX upstream configuration
listen UNICORN_SOCKET, :backlog => 64

# Where to store the pid file for the server process.
pid UNICORN_PID
stderr_path UNICORN_STDERR
stdout_path UNICORN_STDOUT

ENV['BUNDLE_GEMFILE'] = File.join(CURRENT, 'Gemfile')

before_fork do |server, worker|
  # When the signal is sent to the old server process to start up a new
  # master process with the new code release, the old server's pidfile
  # is suffixed with ".oldbin".
  old_pid = "#{UNICORN_PID}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # already shut down
    end
  end
end
