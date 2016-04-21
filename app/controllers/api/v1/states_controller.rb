module Api
  module V1
    class Api::V1::StatesController < ApplicationController
      respond_to :json

      def index
        respond_with State.format_data
      end
    end
  end
end
