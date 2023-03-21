class Person
    attr_accessor :id, :name, :age, :parent_permission
    def initialize(name, age, parent_permission)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def is_of_age
        if (@age >= 18)
            return true
        else
            return false
        end
    end

    def can_use_services
        if( @is_of_age or @parent_permission)
            return true
        else
            return false
        end
    end
end

class Student < Person

    def play_hooky
        return "¯\(ツ)/¯"
    end
end

class Teacher < Person

end