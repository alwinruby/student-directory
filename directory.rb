def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-----------------------------------------------------------------------"
end

def print(students)
 index = 0
 while students.length > index
   puts "#{index + 1}. #{students[index][:name].center(10)} #{students[index][:cohort].to_s.center(15)} " +
          "#{students[index][:hobbies].center(15)} #{students[index][:birth_country].center(15)} " +
          "#{students[index][:height].center(15)}"
      index +=1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  # create an empty array
  students = []
  name = 'Alan'

  # while the name is not empty, repeat this code
  until name.empty?
    puts "Please enter the names of the student"
    # get the first name
    name = gets.chomp.capitalize
    break if name.empty?
    puts "Please enter your hobbies"
    # get hobbies
    hobbies = gets.chomp.capitalize
    puts "Please enter your country of birth"
    # get the country
    birth_country = gets.chomp.capitalize
    puts "Please enter your height"
    # get the height
    height = gets.chomp

    puts "To finish, just hit return twice"

    # add the student hash to the array
    students << {name: name, cohort: :November, hobbies: hobbies, birth_country: birth_country, height: height}
    puts "Now we have #{students.count} students"

  end

  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
