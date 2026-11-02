require 'csv'
require_relative '../models/message'

class MessageRepository
  def initialize(csv_path, language_repository: nil)
    @csv_path = csv_path
    @language_repository = language_repository
    @messages = []
    load_csv if File.exist?(@csv_path)
    @next_id = @messages.empty? ? 1 : @messages.last.id + 1
  end

  def create(message)
    message.id = @next_id
    @next_id += 1
    @messages << message
    save_csv
  end

  def all
    @messages
  end

  def all_for(language)
    @messages.select { |message| message.language == language }
  end

  def find_language(language_id)
    return nil if language_id.nil? || language_id.empty? || @language_repository.nil?

    @language_repository.find(language_id.to_i)
  end

  private

  def load_csv
    CSV.read(@csv_path, headers: true).each do |row|
      language = find_language(row["language_id"])
      @messages << Message.new(id: row["id"].to_i, content: row["content"], role: row["role"], language: language)
    end
  end

  def save_csv
    CSV.open(@csv_path, "w") do |csv|
      csv << %i[id content role language_id]
      @messages.each do |message|
        csv << [message.id, message.content, message.role, message.language.id]
      end
    end
  end
end
