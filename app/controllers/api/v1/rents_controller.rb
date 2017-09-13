module Api
  module V1
    class RentsController < ApiController
      def index
        rent = Rent.new(user_id: params[:user_id])
        authorize rent
        render json: policy_scope(Rent)
      end

      def create
        @rent = Rent.new(rent_params)
        authorize @rent
        if @rent.save
          RentMailer.new_rent_notification(@rent).deliver_later
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
