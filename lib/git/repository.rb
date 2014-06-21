require_relative 'base'
require_relative 'log'
require_relative 'branch'

module Agitable
  module Git
    class Repository < ::Agitable::Git::Base
      include ::Agitable::Git::Branch
      include ::Agitable::Git::Log
    end
  end
end
