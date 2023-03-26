require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, _parent_permission, _classroom, name = 'Unknown')
    super(age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom=(classroom)
    @classroom = classroom.label
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
