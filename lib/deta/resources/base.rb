module Deta
  class BaseResource < Resource
    def put(*attributes)
      items = {items: attributes}
      
      BaseObject.new put_request([base_url, client.project_id, base_name, "items"].join("/"), body: items).body
    end

    def get(key = nil)
      BaseObject.new get_request([base_url, client.project_id, base_name, "items", key].join("/")).body
    end

    def delete(key = nil)
      BaseObject.new delete_request([base_url, client.project_id, base_name, "items", key].join("/")).body
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
      
      BaseObject.new patch_request([base_url, client.project_id, base_name, "items", key].join("/"), body: request).body
    end

    def query(query: nil, limit: nil, last: nil)
      return ":)"
    end
  end
end