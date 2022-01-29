module Deta
  class Resource
    attr_reader :client, :resource_name

    def initialize(client, resource_name)
      @client = client
      @resource_name = resource_name
    end

    private

      def put_request(url, body:, headers: {})
        handle_response client.connection.put(url, body, headers)
      end

      def get_request(url, params: {}, headers: {})
        handle_response client.connection.get(url, params, headers)
      end

      def patch_request(url, body:, headers: {})
        handle_response client.connection.patch(url, body, headers)
      end

      def delete_request(url, params: {}, headers: {})
        handle_response client.connection.delete(url, params, headers)
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Your request was malformed. #{response.body["errors"]}"
        when 401
          raise Error, "You did not supply valid authentication credentials. #{response.body["errors"]}"
        when 403
          raise Error, "You are not allowed to perform that action. #{response.body["errors"]}"
        when 404
          raise Error, "No results were found for your request. #{response.body["errors"]}"
        when 429
          raise Error, "Your request exceeded the API rate limit. #{response.body["errors"]}"
        when 500
          raise Error, "We were unable to perform the request due to server-side problems. #{response.body["errors"]}"
        end
  
        response
      end
  end
end