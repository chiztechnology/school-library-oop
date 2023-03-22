class Person
    # attr_accessor :id, :name, :age, :parent_permission
    def initialize(name = "Unknown", age, parent_permission = false)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
    end

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