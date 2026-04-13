class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def details
    puts "Name: #{@name}"
    puts "Age: #{@age}"
  end
end

class Student < Person
  attr_accessor :student_id

  def initialize(name, age, student_id)
    super(name, age)
    @student_id = student_id
  end

  def details
    super
    puts "Student ID: #{@student_id}"
  end
end

class Teacher < Person
  attr_accessor :subject

  def initialize(name, age, subject)
    super(name, age)
    @subject = subject
  end

  def details
    super
    puts "Subject: #{@subject}"
  end
end

student = Student.new("Arjun", 20, "S101")
teacher = Teacher.new("Meena", 35, "Math")

student.details
teacher.details