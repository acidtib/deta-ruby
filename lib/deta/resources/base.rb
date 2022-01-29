module Deta
  class BaseResource < Resource
    def put(*attributes)
      items = {items: attributes}
      
      BaseObject.new put_request("#{client.project_id}/#{base_db}/items", body: items).body
    end

    def update(key = nil, set: nil, increment: nil, append: nil, prepend: nil, delete: nil)
      request = {}
      request[:set] = set if set
      request[:increment] = increment if increment
      request[:append] = append if append
      request[:prepend] = prepend if prepend
      request[:delete] = delete if delete

      BaseObject.new patch_request("#{client.project_id}/#{base_db}/items/#{key}", body: request).body
    end

    def get(key = nil)
      BaseObject.new get_request("#{client.project_id}/#{base_db}/items/#{key}").body
    end

    def delete(key = nil)
      BaseObject.new delete_request("#{client.project_id}/#{base_db}/items/#{key}").body
    end
  end
end