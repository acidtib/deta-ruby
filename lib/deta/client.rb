module Deta
  class Client
    BASE_URL = "https://database.deta.sh/v1/"

    attr_reader :project_id, :project_key, :adapter

    def initialize(project_key:, adapter: Faraday.default_adapter)
      @project_id = project_key.split("_").first
      @project_key = project_key
      @adapter = adapter
    end

    def base(base_name = nil)
      BaseResource.new(self, base_name)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.headers['X-API-Key'] = project_key
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end
  end
end