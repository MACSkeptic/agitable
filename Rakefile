require 'fileutils'

namespace :unicorn do
  task :setup do
    [:tmp, :pid, :log].each do |dir|
      FileUtils.mkpath "./#{dir}" unless File.exists? "./#{dir}"
    end
  end
end

namespace :server do
  desc 'starts the server'
  task(start: [:"unicorn:setup"]) do
    pid_file = './tmp/pids/unicorn.pid'

    puts 'there are already unicorns galloping >_<' or exit 0 if File.exists? pid_file

    puts 'starting the server...'
    `bundle exec unicorn -c ./unicorn.rb -E development -D`
    puts 'server started at http://127.0.0.1:8080'
  end

  desc 'stops the server'
  task(stop: [:"unicorn:setup"]) do
    pid_file = './tmp/pids/unicorn.pid'

    puts 'all the unicorns are already dead x_x' or exit 0 unless File.exists? pid_file

    puts 'stoppping the server...'
    `cat #{pid_file} | xargs kill -QUIT`
    puts 'server stopped'
  end
end
