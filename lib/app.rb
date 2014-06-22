# -*- encoding : utf-8 -*-
require 'sinatra/base'

require_relative 'controllers'

module Agitable
  class App < Sinatra::Base
    use Controllers::CommitsController
    use Controllers::CommitController
    use Controllers::HomeController

    set :default_encoding, 'UTF-8'
  end
end
