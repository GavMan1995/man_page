Search_string =  "********** Please type in command for man page you want to see *********"
Main_page_string = "\n\n----Man Page Cheat Sheet----\n1. Command Line\n2. Search\n3. search history\n4. Exit\n----------------------------"
@history = []
#===============================main page=========================================================
def main_page
  puts Main_page_string
  print ">"
    choice = gets.strip.to_i
    cmd_or_search(choice)
end

#choices from main page
def cmd_or_search(choice2)
  case choice2
    when 1
      command_line
    when 2
      search
    when 3
      puts @history
      main_page
    when 4
      puts "thank you have a nice day"
    else
      puts "invalid input"
      main_page
  end
end

#======================= Command Line ========================================================
#displays command line and asks for a choice
def command_line
  puts "Enter a man page you would like to see.\n\n1. mv\n2. mkdir\n3. ls\n4. cd\n\n"
  cmd_choice2 = gets.strip.to_i
  command_line_choice(cmd_choice2)
end

#displays man page according to the choice made in main_page method
def command_line_choice(cmd_choice)
  case cmd_choice
    when 1
      puts `man mv`
      main_page
    when 2
      puts `man mkdir`
      main_page
    when 3
      puts `man ls`
      main_page
    when 4
      puts `man cd`
      main_page
    else
      puts "invalid input"
      command_line
    end
end

#======================== Search Page =============================================================
def search
  puts Search_string
  print ">"
  search_choice = gets.strip
  man_page_search(search_choice)
end

#method that displays the man page from the selection made in the method above
def man_page_search(search_choice2)
  @history << search_choice2
  puts `man #{search_choice2}`
  main_page
end
main_page
