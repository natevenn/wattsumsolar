module Api
  module V1
    class Api::V1::StatesController < ApplicationController
      respond_to :json

      def index
        respond_with State.format_data
      end

      def show
        state = State.find_by(name: params[:name])
        respond_with state.format_data_for_state
      end
    end
  end
end
