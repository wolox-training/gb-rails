module Api
  module V1
    class RentsController < ApiController
      def index
        @rents = Rent.all
        render json: @rents
      end

      def create
        @rent = Rent.new(rent_params)
        @rent.save
        render json: @rent
      end

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :from, :to)
      end
    end
  end
end
