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