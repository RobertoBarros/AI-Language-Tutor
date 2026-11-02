require_relative '../views/messages_view'

class MessagesController
  def initialize(message_repository, language)
    @message_repository = message_repository
    @language = language
    @view = MessagesView.new
    @chat = RubyLLM.chat.with_instructions(system_prompt)
  end

  def add
    content = @view.ask_content
    message = Message.new(content: content, role: "user", language: @language)
    @message_repository.create(message)

    response = @chat.ask(content)
    assistant_message = Message.new(role: "assistant", content: response.content, language: @language)
    @message_repository.create(assistant_message)

    @view.display_one(assistant_message)
  end

  def list
    messages = @message_repository.all
    @view.display_list(messages)
  end

  private

  def system_prompt
    "You are a friendly, patient language tutor. The user wants to practice #{@language.name} " \
      "at a #{@language.level} level. When they ask how to say something, answer primarily in " \
      "#{@language.name} and add a short English translation in parentheses. Keep your answers " \
      "short and encouraging."
  end
end
