class Person
    def initialize(age, name = "Unknown", parent_permission: false)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    attr_reader :id
    attr_accessor :name, :age

    def id
        @id
    end

    def name
        @name
    end

    def age
        @age
    end

    def name = (name)
        @name = name
    end

    def age = (age)
        @age = age
    end

    private
    def is_of_age?
        if (@age >= 18)
            return true
        else
            return false
        end
    end

    def can_use_services?
        if( @is_of_age or @parent_permission)
            return true
        else
            return false
        end
    end
end

Person.new(14, 'Israel')