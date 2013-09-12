$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.3@new_depot'        # Or whatever env you want it to run in.
set :rvm_type, :user  # Copy the exact line. I really mean :user here

default_run_options[:pty] = true  # Must be set for the password prompt from git to work


set :application, "new_depot"
set :repository,  "git://github.com/hhuai/new_depot.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "90tian"  # The server's user for deploys
set :branch, "master"
set :use_sudo, false

set :deploy_to, "~/#{application}"

set :domain, "90tian.com"
set :git_shallow_clone, 1

require 'bundler/capistrano'  
#set :bundle_flags, '--quiet'  
 
role :web, domain
role :app, domain

namespace :deploy do
  task :start do 
    run "cd #{current_release}; passenger start -p 3007 -e production -d"
  end

  task :stop do 
    run "cd #{current_release}; passenger stop --port 3007"
  end

  task :redeploy do
  end

  # Assumes you are using Passenger
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :finalize_update, :except => { :no_release => true } do
  end
end