class LanguagesView
  def ask_name
    puts "Enter language:"
    gets.chomp
  end

  def ask_level
    puts "Enter your language_level (A1, B2, etc...):"
    gets.chomp
  end

  def ask_index
    puts "Enter language_index:"
    gets.chomp.to_i - 1
  end

  def display_list(languages)
    languages.each_with_index do |language, index|
      puts "#{index + 1}. #{language.name} (#{language.level})"
    end
  end

  def display_not_found
    puts 'Language not found... Select a language first.'
  end
end
