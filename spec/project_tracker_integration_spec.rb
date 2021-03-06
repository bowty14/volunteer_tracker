require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('project_name', :with => 'Teaching Kids to Code')
    click_button('Create project')
    expect(page).to have_content('Teaching Kids to Code')
  end
end

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    visit '/projects'
    click_link('Teaching Kids to Code')
    click_link('Edit project')
    fill_in('title', :with => 'Teaching Ruby to Kids')
    click_button('Update title')
    expect(page).to have_content('Teaching Ruby to Kids')
  end
end

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    id = test_project.id
    visit "/project/#{id}"
    click_button('Delete project')
    visit '/projects'
    expect(page).not_to have_content("Teaching Kids to Code")
  end
end

describe 'the volunteer detail page path', {:type => :feature} do
  it 'shows a volunteer detail page' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Jasmine', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/project/#{project_id}"
    click_link('Jasmine')
    click_link('Edit volunteer')
    fill_in('name', :with => 'Jane')
    click_button('Update name')
    expect(page).to have_content('Jane')
  end
end