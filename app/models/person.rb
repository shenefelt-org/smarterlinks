class Person < ApplicationRecord
    has_many :time_entries, dependent: :destroy
    has_many :user_actions, dependent: :destroy
    has_one :person_information, dependent: :destroy

    before_create :generate_new_id_number
    before_save :set_full_name
    before_save :generate_username
    before_save :generate_email
    before_create :set_hire_date

    self.filter_attributes = [
        :created_at,
        :updated_at,
    ]

    

    def hire_date_formatted
        hire_date.strftime("%B %d, %Y") if hire_date.present?
    end

    def termination_date_formatted
        term_date.strftime("%B %d, %Y") if term_date.present?
    end

    def deleted_at_formatted
        deleted_at.strftime("%B %d, %Y") if deleted_at.present?
    end

    def clock_in
        TimeEntry.create(person_id: id, time: Time.current, action: 'clock_in')
    end

    def clock_out
        TimeEntry.create(person_id: id, time: Time.current, action: 'clock_out')
    end

    def login
        UserAction.create(person_id: id, action: 'login')
    end

    def logout
        UserAction.create(person_id: id, action: 'logout')
    end

    def terminate
        update(term_date: Date.today)
    end

    def active?
        return true if rehire_date.present?
        term_date.nil? || term_date > Date.today
    end

    def soft_delete
        update(term_date: Time.current)
    end

    def display
       return nil if self.nil?
       puts "First Name: #{first_name}"
       puts "Last Name: #{last_name}"
       puts "Hire Date: #{hire_date_formatted}" if hire_date.present?
       puts "Termination Date: #{termination_date_formatted}" unless !term_date.present?
       puts "Rehire Date: #{rehire_date_formatted}" unless !rehire_date.present?
       puts "Active: #{active?}"
       puts "Terminated: #{!active?}" unless self.active?
       puts "Working Location: #{working_location}" unless working_location.nil?
       puts "Location ID: #{location_id}" unless location_id.nil?
       puts 

    end

    private
    # Generate a new id_number by incrementing the maximum existing id_number in the database
    def generate_new_id_number
        self.id_number = (Person.maximum(:id_number) || 0) + 1
    end

    # Generate the full name by combining first_name, middle_name, and last_name
    def set_full_name
        self.name = "#{first_name} #{middle_name} #{last_name}" || 'NULL'
    end

    # Generate a username by combining first_name and last_name in lowercase
    def generate_username
        username = "#{first_name.downcase}.#{last_name.downcase}"
        if Person.exists?(username: username)
            total = Person.where(username: username).count
            username = "#{first_name.downcase}.#{last_name.downcase}#{total + 1}"
        end
        self.username = username
    end

    # Generate an email address by combining first_name and last_name in lowercase
    def generate_email
        email = "#{first_name.downcase}.#{last_name.downcase}@periwinkle-octipi.com"
        if Person.exists?(email: email)
            total = Person.where(email: email).count
            email = "#{first_name.downcase}.#{last_name.downcase}#{total + 1}@periwinkle-octipi.com"
        end
        self.email = email
    end

    def set_hire_date
        self.hire_date ||= Date.today
    end
end
