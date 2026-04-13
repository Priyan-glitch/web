students = [
  ["Alice", "S001", [85, 90, 78]],
  ["Bob", "S002", [75, 80, 88]],
  ["Charlie", "S003", [90, 92, 95]]
]

def calculate_average(grades)
  grades.sum.to_f / grades.length
end

loop do
  puts "\n===== GRADEBOOK MENU ====="
  puts "1. Add Student"
  puts "2. Update Grades"
  puts "3. Remove Student"
  puts "4. Calculate Average"
  puts "5. View Subset"
  puts "6. View Full Gradebook"
  puts "7. Exit"

  print "Choose option: "
  choice = gets.chomp.to_i

  case choice

  when 1
    print "Enter name: "
    name = gets.chomp
    print "Enter ID: "
    id = gets.chomp
    print "Enter grades (space separated): "
    grades = gets.chomp.split.map(&:to_i)

    students << [name, id, grades]
    puts "Student added!"

  when 2
    print "Enter ID to update: "
    id = gets.chomp

    student = students.find { |s| s[1] == id }

    if student
      print "Enter new grades: "
      student[2] = gets.chomp.split.map(&:to_i)
      puts "Grades updated!"
    else
      puts "Student not found."
    end

  when 3
    print "Enter ID to remove: "
    id = gets.chomp

    students.reject! { |s| s[1] == id }
    puts "Student removed (if existed)."

  when 4
    print "Enter ID: "
    id = gets.chomp

    student = students.find { |s| s[1] == id }

    if student
      avg = calculate_average(student[2])
      puts "Average grade for #{student[0]}: #{avg.round(2)}"
    else
      puts "Student not found."
    end

  when 5
    print "Enter start index: "
    start_i = gets.chomp.to_i
    print "Enter end index: "
    end_i = gets.chomp.to_i

    subset = students[start_i..end_i]

    subset.each do |s|
      avg = calculate_average(s[2])
      puts "#{s[0]} (ID: #{s[1]}) - Avg: #{avg.round(2)}"
    end

  when 6
    puts "\nGradebook:"
    students.each do |s|
      avg = calculate_average(s[2])
      puts "#{s[0]} | ID: #{s[1]} | Grades: #{s[2].join(", ")} | Avg: #{avg.round(2)}"
    end

  when 7
    break

  else
    puts "Invalid option."
  end
end