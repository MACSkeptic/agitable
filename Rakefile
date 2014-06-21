require 'fileutils'

UNICORN_PID_FILE = './tmp/pids/unicorn.pid'

namespace :unicorn do
  task :setup do
    [:tmp, :pid, :log].each do |dir|
      FileUtils.mkpath "./#{dir}" unless File.exists? "./#{dir}"
    end
  end
end

namespace :server do
  desc 'logs, tell the tales, the tails in details'
  task(logs: [:"unicorn:setup"]) do
    system 'tail -f log/*'
  end

  desc 'unicorns++'
  task(start: [:"unicorn:setup"]) do
    puts 'there are already unicorns galloping >_<' or exit 0 if File.exists? UNICORN_PID_FILE

    puts 'starting the server...'
    `bundle exec unicorn -c ./unicorn.rb -E development -D`
    puts 'server started at http://127.0.0.1:8080'
  end

  desc 'unicorns--'
  task(stop: [:"unicorn:setup"]) do
    puts 'all the unicorns are already dead x_x' or exit 0 unless File.exists? UNICORN_PID_FILE

    puts 'stoppping the server...'
    `cat #{UNICORN_PID_FILE} | xargs kill -QUIT`
    puts 'server stopped'
  end
end
