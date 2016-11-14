set :stage, :production

server '138.197.16.198', user: 'deploy', roles: %w{web app db}