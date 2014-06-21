# -*- encoding : utf-8 -*-
require 'sinatra/base'
require 'active_support/core_ext/object'

require_relative '../git'

module Agitable
  module Controllers
    class CommitsController < Sinatra::Base
      get '/commits/:repository/:story' do
        repository_name = params[:repository]
        repository = Agitable::Git::Repository.new("../#{repository_name}")

        content_type :json
        repository.commits_for(params[:story]).to_json
      end
    end
  end
end
