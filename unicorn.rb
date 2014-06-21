# -*- encoding : utf-8 -*-
@base_directory = File.dirname __FILE__

worker_processes 2
working_directory @base_directory

timeout 300

pid "#{@base_directory}/tmp/pids/unicorn.pid"

stderr_path "#{@base_directory}/log/unicorn.stderr.log"
stdout_path "#{@base_directory}/log/unicorn.stdout.log"
