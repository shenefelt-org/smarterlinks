require 'csv'
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

    def self.import_from_csv()
        csv_path = Rails.root.join('./app/storage/CSV/person_import.csv')
        import_count = 0

        CSV.foreach(csv_path, headers: true) do |row|

            person = Person.create(
                first_name: row['first_name'],
                last_name: row['last_name'],
            )
            person.create_person_information(
                person_id: person.id,
                address: row['address'],
                dob: row['dob']
            )
            import_count += 1
        end

        "Imported #{import_count} people"
    end
    
end
