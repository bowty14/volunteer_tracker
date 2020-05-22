require('sinatra') 
require('sinatra/reloader') 
require('./lib/project_tracker.rb')
also_reload('lib/**/*.rb') 