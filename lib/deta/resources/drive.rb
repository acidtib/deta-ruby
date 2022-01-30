module Deta
  class DriveResource < Resource
    @@api_url = "https://drive.deta.sh/v1"

    def get(name = nil)
      params = {}
      params[:name] = name if name

      get_request([@@api_url, client.project_id, resource_name, "files", "download"].join("/"), params: params).body
    end

    def list(limit: nil, prefix: nil, last: nil)
      params = {}
      params[:limit] = limit if limit
      params[:prefix] = prefix if prefix
      params[:last] = last if last

      DriveObject.new get_request([@@api_url, client.project_id, resource_name, "files"].join("/"), params: params).body
    end

    def delete(attributes)
      params = {}
      if attributes.is_a?(Array)
        params[:names] = attributes
      else
        params[:names] = [attributes]
      end

      DriveObject.new delete_request_with_body([@@api_url, client.project_id, resource_name, "files"].join("/"), body: params).body
    end
  end
end