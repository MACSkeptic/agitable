require './lib/app'
require 'sprockets'
require 'sass'

map '/' do
  run Agitable::App
end

map '/js' do
  asset_pipeline = Sprockets::Environment.new
  asset_pipeline.append_path 'client/js'
  run asset_pipeline
end

map '/css' do
  asset_pipeline = Sprockets::Environment.new
  asset_pipeline.append_path 'client/css'
  asset_pipeline.append_path 'client/scss'
  run asset_pipeline
end

map '/templates' do
  asset_pipeline = Sprockets::Environment.new
  asset_pipeline.append_path 'client/templates'
  run asset_pipeline
end
