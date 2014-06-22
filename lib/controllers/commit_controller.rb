# -*- encoding : utf-8 -*-
require 'sinatra/base'
require 'active_support/core_ext/object'

require_relative '../git'

module Agitable
  module Controllers
    class CommitController < Sinatra::Base
      get '/commit/:repository/:commit' do
        repository_name = params[:repository]
        repository = Agitable::Git::Repository.new("../#{repository_name}")

        content_type :json
        {
          branches: repository.branches_for(params[:commit])
        }.to_json
      end
    end
  end
end
