class MessagesView
  def ask_content
    puts 'Enter your message:'
    gets.chomp
  end

  def display_one(message)
    puts "#{message.role == 'user' ? 'You:' : 'Tutor:'} #{message.content}"
  end

  def display_list(messages)
    puts 'No messages yet. Start the conversation by sending a message!' if messages.empty?

    messages.each do |message|
      prefix = message.role == 'user' ? 'You' : 'Tutor'
      puts "#{prefix}: #{message.content}"
    end
  end
end
