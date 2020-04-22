module Api
  module V1
    class BalancesController < ApiController
      def index
        payload = FetchBalances.call(client_id: current_client['client_id']) # serialize it.
        render json: payload
      end

      class FetchBalances
        def self.call
          { test: 'test' }
        end
      end
    end
  end
end
