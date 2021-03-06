
#set :application,           "myapp"
#set :domain,                "server.local"
#set :repo_url,              "git@github.com:joaoinacio/capi-deploy.git"

# ask for the branch to use, defaults to current
ask :branch,                proc { `git rev-parse --abbrev-ref HEAD`.chomp }

#set :keep_releases,         3
#set :symfony_env,           "dev"

#set :composer_install_flags, '--no-interaction'

#server 'server.local',      user: 'jcinacio', roles: ['web','app','db'], ssh_options: { user: 'jcinacio' }
#set :deploy_to,             "/var/www/dev." + fetch(:application)

# capistrano/withrsync config
set :scm,                   "git"
set :sync_src,              "tmp/deploy"
set :rsync_dest,            "shared/deploy"
set :rsync_options,         %w[
  -avz
  --recursive --delete --delete-excluded
  --exclude .git*
  --exclude /config/database.yml
]

