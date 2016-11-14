set :application, 'hello_again_woodstock'
set :repo_url, 'https://github.com/crackerjack540/hello_again_woodstock.git'
set :rvm_type, :user

set :deploy_to, '/home/deploy/hello_again_woodstock'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
