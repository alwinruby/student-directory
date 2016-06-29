require 'csv' #added csv
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load a list from files"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "Input the students selected"
    input_students
  when "2"
    puts "Show the students selected"
    show_students
  when "3"
    puts "Saving students to file"
    save_students
  when "4"
    puts "Loading list of students selected"
    load_students
  when "9"
    puts "Exiting"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "Then add full month of the cohort"
  puts "To finish, just hit return twice"
  name = 'user_input'
  # while the name is not empty, repeat this code
  while !name.empty? do
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
    if !name.empty?
      # add the student hash to the array
      add_students(name,cohort)
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "What name would like to call the file?"
  # open the file for writing
    CSV.open(gets.chomp, "w") do |file|
      # iterate over the array of students
      @students.each do |student|
        file << [student[:name], student[:cohort]]
      end
  end
end

def load_students(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort)
    end
  end
end

def try_load_students
  puts "What is the name of the file you wish to load"
  filename = gets.chomp# filename
  return if filename.nil? # get out of the method if it isn't given

  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
