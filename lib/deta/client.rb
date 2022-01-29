module Deta
  class Client
    attr_reader :project_id, :project_key, :adapter

    def initialize(project_key:, adapter: Faraday.default_adapter)
      @project_id = project_key.split("_").first
      @project_key = project_key
      @adapter = adapter
    end

    def base(base_name = nil)
      BaseResource.new(self, base_name)
    end

    def drive(drive_name = nil)
      DriveResource.new(self, drive_name)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.headers['X-API-Key'] = project_key
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end
  end
end