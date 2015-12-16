# load defaults

load File.expand_path("../default.rb", __FILE__)

server 'server.local',      user: 'jcinacio', roles: ['web','app','db'], ssh_options: { user: 'jcinacio' }

set :application,           "myapp"
set :deploy_to,             "/var/www/dev." + fetch(:application)

