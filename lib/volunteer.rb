class Volunteer
  attr_reader :id 
  attr_accessor :name, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(volunter_to_compare)
    self.name() == volunter_to_compare.name()
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id")
      volunteers.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteers
  end

  # def save 
  #   result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
  #   @id = result.first().fetch("id").to_i
  # end
end