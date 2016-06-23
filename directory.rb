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
    name = gets.chomp.capitalize
    break if name.empty?
    puts 'Please enter your cohort (using full month)'
    cohort = gets.chomp.capitalize
    puts 'Please enter your hobbies'
    hobbies = gets.chomp.capitalize
    puts 'Please enter your country of birth'
    birth_country = gets.chomp.capitalize
    puts 'Please enter your height'
    height = gets.chomp
    if cohort.empty? or !$months.include?(cohort)
      cohort = default
    end
    puts 'To finish, just hit return twice'
    students << {name: name, cohort: cohort, hobbies: hobbies, birth_country: birth_country, height: height}
    puts "Now we have #{students.count} students"
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
  puts "Overall, we have #{names.count} great students"
end

def print_cohort(students)
  cohort_month = []
  puts "See by specific cohort month? - Enter Full Month Please"
  month = gets.chomp.capitalize
  students.map do |student|
    if student[:cohort]== month
      cohort_month << [student[:name], student[:hobbies], student[:birth_country], student[:height] ]
    end
  end

  puts "students in #{month} cohort: "
  cohort_month.each do|cohort|
    puts cohort.each { |details| details }.join(" ")
  end
end

students = input_students
print_header
print(students)
print_footer(students)
print_cohort(students)
