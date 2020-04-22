class InvalidAPIkeyError < StandardError; end

module Api
  module V1
    class AuthController < ApiController
      def create
        render json: { jwt: encode_jwt(params[:api_key]) }
      rescue InvalidAPIkeyError
        render json: {}, status: 401
      end

      private

      def encode_jwt(api_key)
        result = AuthenticateClient.call(api_key)
        if result.success?
          JWT.encode(result.payload, nil, 'none')
        else
          fail InvalidAPIkeyError
        end
      end


      class AuthenticateClient
        def self.call(api_key)
          new.call(api_key)
        end

        def call(api_key)
          # ... get all data from API
          self
        end

        def success?
          true
        end

        def payload
          {
            client_id: 1,
            client_name: 'Patryk Tyszka'
          }
        end
      end
    end
  end
end
