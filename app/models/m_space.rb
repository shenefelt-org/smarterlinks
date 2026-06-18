class MSpace < ApplicationRecord
# static methods 
    class << self
        def asset_server_url
            env_value_for("ASSET_SERVER_URL")
        end

        def asset_server_upload_url
            env_value_for("ASSET_SERVER_UPLOAD_URL")
        end

        def asset_server_api_url
            env_value_for("ASSET_SERVER_API_URL")
        end

        private

        def env_value_for(key)
            ENV.fetch(key)
        end
    end

    def asset_server_url
        self.class.asset_server_url
    end

    def asset_server_upload_url
        self.class.asset_server_upload_url
    end

    def asset_server_api_url
        self.class.asset_server_api_url
    end
end
