module TimeEntriesHelper

    # Get all entries for a given date - if no date is provided, default to today
    def self.time_entries_by_day(date: Date.today)
        TimeEntry.where(time: date.beginning_of_day..date.end_of_day).order(:time)
    end

    def self.get_last_id_number
        TimeEntry.maximum(:id) || 0
    end


end
