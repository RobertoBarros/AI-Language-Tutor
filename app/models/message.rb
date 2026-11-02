class Message
  attr_reader :content, :role
  attr_accessor :id, :language

  def initialize(attributes = {})
    @id = attributes[:id]
    @content = attributes[:content]
    @role = attributes[:role]
    @language = attributes[:language]
  end
end
