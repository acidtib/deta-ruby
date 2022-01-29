module Deta
  class BaseResource < Resource
    @@api_url = "https://database.deta.sh/v1"

    def put(attributes)
      items = {}
      if attributes.is_a?(Array)
        items["items"] = attributes
      else
        items["items"] = [attributes]
      end

      BaseObject.new put_request([@@api_url, client.project_id, resource_name, "items"].join("/"), body: items).body
    end

    def get(key = nil)
      BaseObject.new get_request([@@api_url, client.project_id, resource_name, "items", key].join("/")).body
    end

    def delete(key = nil)
      BaseObject.new delete_request([@@api_url, client.project_id, resource_name, "items", key].join("/")).body
    end

    def insert(*attributes)
      return ":)"
    end

    def update(key = nil, set: nil, increment: nil, append: nil, prepend: nil, delete: nil)
      request = {}
      request[:set] = set if set
      request[:increment] = increment if increment
      request[:append] = append if append
      request[:prepend] = prepend if prepend
      request[:delete] = delete if delete
      
      BaseObject.new patch_request([@@api_url, client.project_id, resource_name, "items", key].join("/"), body: request).body
    end

    def query(query: nil, limit: nil, last: nil)
      return ":)"
    end
  end
end