# Capistrano deploy config for ezplatform

#
#  capistrano/symfony
#  ==================

# Default symfony environment
set :symfony_env,           "prod"

# Controllers to clear
#set :controllers_to_clear,  ["app_*.php"]
set :controllers_to_clear,  []

# Files that need to remain the same between deploys
#set :linked_files,          []
set :linked_files,          [ fetch(:app_config_path)+"/parameters.yml" ]
# Dirs that need to remain the same between deploys (shared dirs)
#set :linked_dirs,           [fetch(:log_path), fetch(:web_path) + "/uploads"]
set :linked_dirs,           [ fetch(:log_path), "vendor" ]

# Dirs that need to be writable by the HTTP Server (i.e. cache, log dirs)
set :file_permissions_paths, [ fetch(:log_path), fetch(:cache_path), fetch(:web_path) ]
# Name used by the Web Server (i.e. www-data for Apache)
set :file_permissions_users, [ 'www-data' ]
# Name used by the Web Server (i.e. www-data for Apache)
set :webserver_user,        "www-data"

# Method used to set permissions (:chmod, :acl, or :chgrp)
#set :permission_method,     false
set :permission_method,     :acl
# Execute set permissions
#set :use_set_permissions,   false
set :use_set_permissions,   true

# Symfony console path
#set :symfony_console_path, fetch(:app_path) + "/console"

# Symfony console flags
set :symfony_console_flags, "--no-debug --env=" + fetch(:symfony_env)

# Assets install path
#set :assets_install_path,   fetch(:web_path)
# Assets install flags
#set :assets_install_flags,  '--symlink'
# Assetic dump flags
#set :assetic_dump_flags,  ''

