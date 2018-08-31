@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name, cohort and favourite hobby of each students".center(50)
  puts "To finish, press enter 3 times".center(50)
  # get the first name
  name = gets.chomp
  puts "which cohort is #{name} entering?"
  cohort = gets.chomp
  puts "Does #{name} have any hobbies?"
  hobby = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{@students.count} students".center(50)
    # get another name from the user
    name = gets.chomp
    puts "which cohort is #{name} entering?"
    cohort = gets.chomp
    puts "Does #{name} have any hobbies?"
    hobby = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts " "
  puts "1. Input the students".center(110)
  puts "2. Show the students".center(110)
  puts "3. Show the students' favourite hobbies".center(110)
  puts "4. Save the list to students.csv".center(110)
  puts "5. Load the list to students.csv".center(110)
  puts "9. Exit".center(110) # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def students_hobbies
  @students.each do |student|
    puts "#{student[:name].capitalize} enjoys #{student[:hobby].capitalize}.".center(110)
  end
  end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    students_hobbies
  when "4"
    save_students
  when "5"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(110)
  puts "-------------".center(110)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name].capitalize} is in the #{student[:cohort].capitalize} cohort,".center(110)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(110)
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, hobby = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby}
  end
  file.close
end

interactive_menu
