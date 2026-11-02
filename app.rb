require 'csv'
require_relative "config"

require_relative 'app/models/message'
require_relative 'app/repositories/message_repository'
require_relative 'app/controllers/messages_controller'
require_relative 'app/views/messages_view'
require_relative 'app/routers/message_router'

require_relative 'app/models/language'
require_relative 'app/repositories/language_repository'
require_relative 'app/controllers/languages_controller'
require_relative 'app/views/languages_view'
require_relative 'app/routers/language_router'


language_repository = LanguageRepository.new("data/languages.csv")
message_repository = MessageRepository.new("data/messages.csv")
languages_controller = LanguagesController.new(language_repository, message_repository)

LanguageRouter.new(languages_controller).run
