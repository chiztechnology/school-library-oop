require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './base_decorator'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :@rentals

  def initialize(age, name, parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(self, book, date)
  end
end
