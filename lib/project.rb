class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save
    title = DB.exec("INSERT INTO projects (name) VALUES ('#{@title}') RETURNING id;")
    @id = title.first().fetch("id").to_i
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end

  def self.all
    returned_projects = DB.exec('SELECT * FROM projects')
    projects = []
    returned_projects.each do |project|
      title = project.fetch("name")
      id = project.fetch("id")
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    project1 = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = project1.fetch("name")
    id = project1.fetch("id")
    Project.new({:title => title, :id => id})
  end
end