# The path in which capistrano caches deployed versions of the source
DEPLOY_TO = '/var/www'

# The current, deployed release
CURRENT = "#{DEPLOY_TO}/current"

# Unicorn server process id file
UNICORN_PID = "#{DEPLOY_TO}/shared/pids/unicorn.pid"

# Log file for messages on standard output
UNICORN_STDOUT = "#{DEPLOY_TO}/shared/log/unicorn.stdout.log"

# Log file for messages on standard error
UNICORN_STDERR = "#{DEPLOY_TO}/shared/log/unicorn.stderr.log"

# Server socket
UNICORN_SOCKET = "#{DEPLOY_TO}/shared/unicorn.socket"
