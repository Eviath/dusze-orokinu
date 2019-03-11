require 'fileutils'
preload_app true
timeout 5
worker_processes ENV['UNICORN_WORKERS'] || 2
listen '/tmp/nginx.socket', backlog: 1024

before_fork do |server,worker|
  FileUtils.touch('/tmp/app-initialized')
end