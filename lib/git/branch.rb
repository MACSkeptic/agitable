module Agitable
  module Git
    module Branch
      def branch(extra_arguments)
        git "branch #{extra_arguments}"
      end

      def all_branches(extra_arguments)
        branch "--all #{extra_arguments}"
      end

      def all_branches_containing(piece_of_commit_message)
        all_branches "--contains \"#{piece_of_commit_message}\""
      end
    end
  end
end
