
#print the list of students
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Kruger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

#and then print them

puts "The students of the boss academy"
puts "               "
students.each do |student|
  puts student
end

#finally we print the total
puts "Overall, we have #{students.count} great students"
