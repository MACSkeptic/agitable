require './lib/app'
require 'sprockets'
require 'sprockets-sass'
require 'sass'

map '/' do
  run Agitable::App
end

map '/js' do
  js_pipeline = Sprockets::Environment.new
  js_pipeline.append_path 'client/js'
  run js_pipeline
end

map '/css' do
  css_pipeline = Sprockets::Environment.new
  css_pipeline.append_path 'client/css'
  css_pipeline.append_path 'client/scss'
  run css_pipeline
end

map '/templates' do
  templates_pipeline = Sprockets::Environment.new
  templates_pipeline.append_path 'client/templates'
  run templates_pipeline
end
