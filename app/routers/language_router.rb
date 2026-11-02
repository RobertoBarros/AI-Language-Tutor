class LanguageRouter
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to your AI Language Tutor!"

    while @running
      display_actions
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.delete
    when 4 then @controller.learn
    when 8 then stop
    else
      puts "Please press 1, 2, 3, 4 or 8"
    end
  end

  def stop
    @running = false
  end

  def display_actions
    puts ""
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List my languages"
    puts "2. Add a language"
    puts "3. Delete a language"
    puts "4. Learn a language"
    puts "8. Exit"
    print "> "
  end
end
