module Agitable
  module Git
    module Log
      attr_writer :format
      attr_writer :separator

      def format
        @format ||= '%H---%s---%ae---%ad'
      end

      def separator
        @separator ||= "\t"
      end

      def log(extra_arguments)
        git "log --all --since='1.1.2014' --format='#{format}' #{extra_arguments}"
      end

      def grep(story)
        log "--grep='#{story}[^0-9]'"
      end

      def commits_for(story)
        grep(story).lines.map do |line|
          hash, message, author, date = line.split '---'
          {
            story: story,
            hash: hash,
            author: author,
            date: date.gsub(/\n/, ''),
            message: message
          }
        end
      end

      def branches_for(hash)
        all_branches_containing(hash).lines.map do |branch|
          branch.lstrip.gsub(/^\*/, '').lstrip.gsub(/\n/, '')
        end
      end

      def rich_log_as_string_for(story)
        rich_log_for(story).map do |commit|
          [
            commit[:story],
            commit[:hash],
            commit[:branches].join(' '),
            commit[:author],
            commit[:date],
            commit[:message]
          ].join separator
        end.join "\n"
      end
    end
  end
end
