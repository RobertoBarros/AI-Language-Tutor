require 'csv'
require_relative '../models/language'

class LanguageRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @languages = []
    load_csv if File.exist?(@csv_path)
    @next_id = @languages.empty? ? 1 : @languages.last.id + 1
  end

  def create(language)
    language.id = @next_id
    @next_id += 1
    @languages << language
    save_csv
  end

  def all
    @languages
  end

  def find(id)
    @languages.find { |language| language.id == id }
  end


  def delete(index)
    @languages.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.read(@csv_path, headers: true).each do |row|
      @languages << Language.new(id: row["id"].to_i, name: row["name"], level: row["level"])
    end
  end

  def save_csv
    CSV.open(@csv_path, "w") do |csv|
      csv << %i[id name level]
      @languages.each do |language|
        csv << [language.id, language.name, language.level]
      end
    end
  end
end
