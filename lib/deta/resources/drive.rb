module Deta
  class DriveResource < Resource
    @@api_url = "https://drive.deta.sh/v1"

    def list(limit: nil, prefix: nil, last: nil)
      params = {}
      params[:limit] = limit if limit
      params[:prefix] = prefix if prefix
      params[:last] = last if last

      BaseObject.new get_request([@@api_url, client.project_id, resource_name, "files"].join("/"), params: params).body
    end
  end
end