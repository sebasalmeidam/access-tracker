# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "acceso"
set :repo_url, 'repourl'

set :migration_role, [:app]
set :keep_releases, 3
#set :sidekiq_user, "deploy"
#set :sidekiq_role, [:app]
set :pty,  false

# set :rvm_type, :user
set :rvm_ruby_version, '2.3.3'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
append :linked_dirs, '.bundle'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/initializers/prod_environment.rb', 'config/master.key')
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/uploads}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  #desc "Update application's crontab entries using Whenever"
  #task :update_cron do
    #on roles(:app) do
      #within current_path do
        #execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
      #end
    #end
  #end

  after :publishing, :restart
  after 'deploy', 'deploy:migrate'
  #after :finishing, 'deploy:update_cron'
end

namespace :logs do
  desc "tail rails logs" 
  task :tail_rails do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/production.log"
    end
  end
end
