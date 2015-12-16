# Capfile

# initial deployment config file
set :deploy_config_path,    'deploy/ezpublish.rb'

# required: set config paths first
set :stage_config_path,     'deploy/stages'


# Include default deployment tasks from capistrano + rsync + symfony
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/withrsync'
require 'capistrano/composer'
require 'capistrano/symfony'


# Load default tasks
Dir.glob('deploy/lib/*.cap').each { |r| import r }

# Load custom tasks
Dir.glob('deploy/tasks/*.cap').each { |r| import r }

# invoke default stage environment
invoke :dev
