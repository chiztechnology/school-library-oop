require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(_classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom=(classroom)
    @classroom = classroom.label
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
