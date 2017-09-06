module Api
  module V1
    class RentsController < ApiController
      def index
        @rents = Rent.all
        render json: @rents
      end

      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          ModelMailer.new_rent_notification(@rent, Time.zone.today).deliver
          render json: @rent
        else
          render json: { errors: @rent.errors }, status: :bad_request
        end
      end

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :from, :to)
      end
    end
  end
end
