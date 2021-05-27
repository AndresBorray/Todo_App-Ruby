require "date"
class Item

    attr_reader :title, :description, :deadline, :done

    def valid_date?(date_string)
        year, month, day = date_string.split "-"
        Date.valid_date? year.to_i, month.to_i, day.to_i
    end

    def initialize(title, deadline, description)
        if valid_date?(deadline)
            @deadline = deadline
        else
            raise 'Invalid date.'
        end
        @title = title 
        @description = description
        @done = false 
    end

    def status
        @done
    end

    def deadline=(new_deadline)
        raise 'Invalid date! Deadline not changed.' if !valid_date?(new_deadline)
        puts "Deadline changed to #{new_deadline}"
        @deadline = new_deadline
    end

    def toggle
       case @done
       when false 
        @done = true
        return "Item Done!"
       when true 
        @done = false
        return "Item not done!" 
       end   
    end

end