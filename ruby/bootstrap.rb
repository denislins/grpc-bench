require 'rubygems'
require 'bundler/setup'

# configure $LOAD_PATH
app_path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(app_path) unless $LOAD_PATH.include?(app_path)

pb_path = "#{app_path}/services"
$LOAD_PATH.unshift(pb_path) unless $LOAD_PATH.include?(pb_path)
