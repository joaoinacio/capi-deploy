

### Deployment automation for eZ Platform / eZ Publish / Symfony web apps.

This is a collection of configuration options and tasks to automate the deployment process(es) of ezplatform/ezpublish based web applications, using [capistrano](https://github.com/capistrano/capistrano).
It supports any number of custom environments (dev, staging, prod, etc), servers, and custom tasks for remote server automation that can be hooked into the deploy process.

### Deployment Process:
The deployment of project files is based on a (locally acessible) git repository and rsync. This has the advantage of:

1. Fast synchronization, as rsync is very efficient, sending only latest changes.
2. Remote server(s) do not need access to the project's git repository.

The process is the following:
* Local project pushes commits to a branch in a (locally-accessible) git repository
* capistrano deploy fetches selected branch from git repo into local cache folder.
* repository cache is rsync'ed with remote repo cache (shared between deployments)
* remote version is deployed from git branch on remote cached.


### Dependencies:
* git
* rsync
* ruby >= 2.0
* [capistrano](https://github.com/capistrano/capistrano) >= 3.0
* [capistrano/symfony](https://github.com/capistrano/symfony)
* [capsitrano/withrsync](https://github.com/linyows/capistrano-withrsync)


#### Installing:
* Install `git`, `rsync`, `ruby` according to your OS/distribution
* make sure [ruby gems](https://rubygems.org/) is using ruby 2+:
    ```bash
    $ gem -v
    2.0.14
    ```

* install capistrano/packages using rubygems:
    ```bash
    $ sudo gem install capistrano capistrano-symfony capistrano-withrsync
    ```

### Configuration
* Create/edit the <environment> file(s) under `deploy/stages` and define settings as needed: application, domain, server(s), git url and branch, etc.
* `Capfile` is the entry point, and specifies which modules and which deployment config file is used, either ezplatform,  ezpublish, or symfony (empty/default config).
* Optional:
    * see `deploy/ezplatform.rb` and `deploy/ezpublish.rb` for default settings and how to finetune them.

    #### File structure

    ```
    |-- Capfile
    |-- deploy
    |   |-- lib
    |   |   |-- tasks
    |   |   |   |-- common.cap
    |   |   |   |-- ezplatform.cap
    |   |-- stages
    │   |   |-- default.rb
    │   |   |-- custom.rb.example
    │   |   |-- staging.rb
    |   |-- tasks
    │   |   |-- mytasks.cap
    │   |-- rsync.rb
    │   |-- ezplatform.rb
    │   |-- ezpublish.rb
    │   |-- symfony.rb
    ```

### Usage
See  capistrano's [online documentation](https://github.com/capistrano/capistrano/blob/master/README.md).
For the most part, a new deployment can be made using, for example:
```
$ cap staging deploy
```

### Modifying
Custom tasks created under `deploy/tasks` will be automatically loaded and made available.
For documentation on developing tasks, see http://capistranorb.com

The following is the flow of capistrano/symfony deployment, see for additional info please refer to https://github.com/capistrano/symfony

```
 deploy
 |__ deploy:starting
 |   |__ [before]
 |   |   |__ deploy:ensure_stage
 |   |   |__ deploy:set_shared_assets
 |   |__ deploy:check
 |__ deploy:started
 |__ deploy:updating
 |   |__ git:create_release
 |   |__ deploy:symlink:shared
 |   |__ symfony:create_cache_dir
 |   |__ symfony:set_permissions
 |__ deploy:updated
 |   |__ symfony:cache:warmup
 |   |__ symfony:clear_controllers
 |__ deploy:publishing
 |   |__ deploy:symlink:release
 |   |__ deploy:restart
 |__ deploy:published
 |__ deploy:finishing
 |   |__ deploy:cleanup
 |__ deploy:finished
     |__ deploy:log_revision

```

