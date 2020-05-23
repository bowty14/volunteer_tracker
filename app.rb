require('sinatra')
require("sinatra/reloader")
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  redirect to('/home')
end

get('/home') do
  erb(:index)
end

post('/home') do
  project_name = params[:project_name]
  project = Project.new({:title => project_name, :id => nil})
  project.save
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id') do
@project = Project.find(params[:id].to_i())
erb(:projects)
end

get('/project/:id') do 
  @project = Project.find(params[:id].to_i())
  @volunteers = @project.volunteers
   
  erb(:project)
end

post('/project/:id/volunteers/volunteers_id') do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.new({:name => params[:volunteer_name], :id => nil, :project_id => params[:id]})
  @volunteer.save
  redirect to('/projects')
end

get('/volunteers') do
  @volunteers = Volunteer.all()
  erb(:volunteer)
end