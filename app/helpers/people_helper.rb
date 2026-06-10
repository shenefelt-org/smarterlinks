module PeopleHelper
    def self.people_for_select
        Person.order(:name).map { |person| [person.name, person.id] }
    end

    def self.people_by_id(id: nil)
        return nil if id.nil?
        Person.find_by(id: id)
    end

    def self.generate_new_id_number
       (Person.maximum(:id) || 0) 
    end

    
end
