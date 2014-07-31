# -*- encoding : utf-8 -*-
module Agitable
  module Git
    module Rebase

      def rebase(from_branch, to_branch)
        update
        checkout to_branch
        reset_from_origin to_branch
        rebase_output = pull_and_rebase_from from_branch
        if has_rebase_conflicts?
          abort_rebase
          return {:success => false}
        else
          push_with_force to_branch
          return {:success => true}
        end
      end

      private

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
