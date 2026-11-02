require_relative '../views/languages_view'
require_relative '../routers/message_router'

class LanguagesController
  def initialize(language_repository, message_repository)
    @language_repository = language_repository
    @message_repository = message_repository
    @view = LanguagesView.new
  end

  def add
    name = @view.ask_name
    level = @view.ask_level

    language = Language.new(name: name, level: level)

    @language_repository.create(language)
  end

  def list
    @view.display_list(@language_repository.all)
  end


  def delete
    @view.display_list(@language_repository.all)
    index = @view.ask_index
    @language_repository.delete(index)
  end

  def learn
    languages = @language_repository.all
    @view.display_list(languages)
    index = @view.ask_index
    language = languages[index]
    return @view.display_not_found if language.nil?

    messages_controller = MessagesController.new(@message_repository, language)
    MessageRouter.new(messages_controller).run
  end
end
