class Language
  attr_reader :name, :level
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @level = attributes[:level]
  end
end
