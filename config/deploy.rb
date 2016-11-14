# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'hello_again_woodstock'
set :repo_url, 'https://github.com/crackerjack540/hello_again_woodstock.git'


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
       execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  
  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
