module Api
  module V1
    class ApiController < ActionController::API
      before_action :authenticate

      def current_client
        return @client if defined? @client
        @client = JWT.decode(params[:gateway_jwt], nil, false)[0]
      end

      def authenticate
        return unless current_client.nil?
        render json: {}, status: 401 and return
      end
    end
  end
end
