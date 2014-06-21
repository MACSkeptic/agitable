# -*- encoding : utf-8 -*-
require 'sinatra/base'
require 'active_support/core_ext/object'

module Agitable
  module Controllers
    class HomeController < Sinatra::Base
      set :views, File.join(File.dirname(__FILE__), '..', 'views')

      helpers do
        def html(name)
          content_type :html
          erb :"#{name}.html", layout: :'layout.html'
        end
      end

      get '/' do
        html :index
      end
    end
  end
end
