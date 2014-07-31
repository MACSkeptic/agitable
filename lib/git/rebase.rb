# -*- encoding : utf-8 -*-
module Agitable
  module Git
    module Rebase
      def pull_and_rebase_from(branch_name)
        git "pull --rebase origin #{branch_name}"
      end

      def abort_rebase
        git 'rebase --abort'
      end

      def has_rebase_conflicts?
        @last_output.include? 'CONFLICT'
      end

      def push_with_force(branch_name)
        git "push origin #{branch_name} --force"
      end

      def reset_from_origin(branch_name)
        git "reset origin/#{branch_name} --hard"
      end

      def checkout(branch_name)
        git "checkout #{branch_name}"
      end
    end
  end
end
