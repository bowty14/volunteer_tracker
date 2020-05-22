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
end