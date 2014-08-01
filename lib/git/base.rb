# -*- encoding : utf-8 -*-
module Agitable
  module Git
    class Base
      attr_reader :base_path
      attr_reader :last_output

      def initialize(base_path)
        @base_path = base_path
      end

      def update
        git 'fetch origin'
      end

      def git(command_fragment)
        full_command = "git -C #{base_path} #{command_fragment}"
        puts "[COMMAND] #{full_command}"
        output = ''
        IO.popen(full_command) { |io| output = io.read }
        @last_output = output
        output
      end
    end
  end
end
