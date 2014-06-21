module Agitable
  module Git
    class Base
      attr_reader :base_path

      def initialize(base_path)
        @base_path = base_path
      end

      def update
        git 'fetch origin'
      end

      def git(command_fragment)
        full_command = "git -C #{base_path} #{command_fragment}"
        puts "[COMMAND] #{full_command}"
        `#{full_command}`
      end
    end
  end
end
