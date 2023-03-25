require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'

class App
  def initialize
    @my_books = []
    @people = []
    @my_rentals = []
  end

  def my_menu
    puts "\nPlease choose any option by entering the correspondant number:"
    puts '1 -> List all books'
    puts '2 -> List all people'
    puts '3 -> Create a person'
    puts '4 -> Create a book'
    puts '5 -> Create a rental'
    puts '6 -> List all rentals for a given person id'
    puts "7 -> Exit\n\n"
    gets.chomp
  end

  def run
    choice = my_menu
    case choice
    when '1'
      action_list_books
    when '2'
      action_list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    else
      puts 'Thanks for using this app ...'
      exit
    end
  end

  def list_books
    @my_books.each_with_index do |x, index|
      puts "#{index}) Title: \"#{x.title}\", Author: #{x.author}\n"
    end
  end

  def list_people
    @people.each_with_index do |x, index|
      puts "\n#{index}) [#{x.class.name}] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}\n"
    end
  end

  def list_rental
    renter = nil
    print "\nID of person: "
    person_id = gets.chomp

    @my_rentals.each do |x|
      renter = x if x.person.id == person_id.to_i
      puts "Date: #{renter.date}, Book: \"#{renter.book.title} Rented by: #{renter.person.name}\n"
    end
    puts
    run
  end

  def action_list_books
    list_books
    run
  end

  def action_list_people
    list_people
    run
  end

  def my_permission(my_char)
    case my_char
    when 'N'
      false
    when 'Y'
      true
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, name, permission, nil)
    @people.push(student)
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2) ? : '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts "\n Person created successfully\n"
    run
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @my_books.push(new_book)
    puts "\n Book created successfully\n"
    run
  end

  def create_rental
    puts "\nSelect a book from the following list by number"
    list_books
    book_index = gets.chomp
    puts "\nSelect a person from the following list by number"
    list_people
    person_index = gets.chomp
    print "\nDate(yyyy/mm/dd): "
    rental_date = gets.chomp
    new_rental = Rental.new(rental_date, @my_books[book_index.to_i], @people[person_index.to_i])
    @my_rentals.push(new_rental)
    puts "\n Rental added successfully\n"
    run
  end
end
