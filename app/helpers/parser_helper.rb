
module ParserHelper

    def self.parse(file_path: nil)
        return nil unless file_path && File.exist?(file_path)

        file_content = File.read(file_path)
        begin
            parsed_data = JSON.parse(file_content)
            return parsed_data
        rescue JSON::ParserError => e
            puts "Error parsing JSON: #{e.message}"
            return nil
        end
    end

    

    
end
