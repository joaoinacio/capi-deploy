#
# capistrano/withrsync
# ====================


# use local git repo
set :scm,                   "git"
set :sync_src,              "tmp/deploy"
set :rsync_dest,            "shared/deploy"
set :rsync_options,         %w[
  -avz
  --recursive --delete --delete-excluded
  --exclude .git*
  --exclude /config/database.yml
]

