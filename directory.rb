$months = ['January', 'February', 'March',
          'April', 'May', 'June', 'July',
          'August', 'September', 'October',
          'November', 'December']
def input_students

  students = []
  name = 'Alan'
  default = 'July'
  until name.empty?
    puts 'Please enter the names of the student'
    name = gets.chop.capitalize
    break if name.empty?
    puts 'Please enter your cohort (using full month)'
    cohort = gets.chop.capitalize
    puts 'Please enter your hobbies'
    hobbies = gets.chop.capitalize
    puts 'Please enter your country of birth'
    birth_country = gets.chop.capitalize
    puts 'Please enter your height'
    height = gets.chop
    if cohort.empty? or !$months.include?(cohort)
      cohort = default
    end
    puts 'To finish, just hit return twice'
    students << {name: name, cohort: cohort, hobbies: hobbies, birth_country: birth_country, height: height}
    #puts "Now we have #{students.count} students"
    if students.count == 1
       puts "Now we have 1 student."
     else
       puts "Now we have #{students.count} students."
     end
  end
    students
end

def print_header
  puts 'The students of my cohort at Makers Academy'
  puts '---------------------------------------------------------------------------'
end

def print(students)
  index = 0
  while students.length > index
    puts "#{index + 1}. #{students[index][:name].center(10)} #{students[index][:cohort].to_s.center(15)} " +
          "#{students[index][:hobbies].center(15)} #{students[index][:birth_country].center(15)} " +
          "#{students[index][:height].center(15)}"
    index += 1
  end
end

def print_footer(names)
  if names.empty?
    puts "There are no students in this cohort!"
  elsif names.length == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

def print_cohort(students)
  cohort_month = []
  if students.empty?
    exit
  else
    puts "See by specific cohort month? - Enter Full Month Please"
    month = gets.chomp.capitalize
    students.map do |student|
      if student[:cohort]== month
        cohort_month << [student[:name], student[:hobbies], student[:birth_country], student[:height] ]
      end
    end
  end

  puts "students in #{month} cohort: "
  cohort_month.each do|cohort|
    puts cohort.each { |details| details }.join(" ")
  end
end

#students = input_students
#print_header
#print(students)
#print_footer(students)
#print_cohort(students)

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Show the Cohort Students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "3"
      print_cohort(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
