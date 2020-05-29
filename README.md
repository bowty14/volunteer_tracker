## Project created on 5/22/2020 - Updated on 5/28/2020

# Volunteer Tracker

#### By **Tyler Bowerman**

## Description

This application allows the user to create, view, update and delete projects. The user can add many projects and can add,view,update, and delete volunteers from a project.

## Specifications

|   Behavior Description                              |  Input Ex.                          |        Output Ex.                   |
|----------------------------------------------------|---------------------------------------|-------------------------------------------------|
|1. As a non-profit employee, I want to view, and add projects.|Type project name in text field of homepage.(Coffee)|When you hit the submit button you will be redirected to the projects page where you can view the created project(s)|
|2. As a non-profit employee, I want to update projects.|When you click on the project name, under the current projects tab you can click on the link "Edit project" Then type the name you'd like to update the project to(Toffee)|On submit you will return to the projects page where you can see the selected project has been updated.|
|3. As a non-profit employee, I want to delete projects.|When you click on the project name, under the current projects tab you can click on the link "Delete project"|On submit you will return to the projects page where you can see the selected project has been deleted.|
|4. As a non-profit employee, I want to view and add volunteers.|After you create a project you can click on its name and there will be a text box where you enter a volunteers name (Tyler)|After submit you will be redirected to the projects page. you can view the volunteers either by selecting a projects name which will only show you those who are working on that project, or you can click on the Current volunteers tab at the top where you can view all of the current volunteers.|


## Setup/Installation Requirements
1. Clone this repository to your machine
2. This app uses a database so you will have to run the following commands to get all funtionality.
<ul>
<li>createdb volunteer_tracker</li>
<li>psql volunteer_tracker < database_backup.sql</li>
<li>createdb -T volunteer_tracker volunteer_tracker_test</li>(This command makes a test database using the volunteer_tracker DB as a template)
</ul>
3. Install packages Ruby Gem by typing `$ bundle install` in the command line
<br>
4. Run the application by typing `ruby app.rb` in the command line
<br>
5. Visit localhost: 4567 to begin using the app
<br>
6. This app uses a database so you will have to run the following commands to get all funtionality.

## Known Bugs
No known bugs at this time.

## Support and contact details
_Have a bug or an issue with this application? [Open a new issue](https://github.com/bowty14/volunteer_tracker/issues) here on GitHub.com_

## Technologies Used
* Ruby
* Sinatra
* Capybara
### License

*This software is licensed under the MIT license* 

Copyright (c) 2020 **Tyler Bowerman**