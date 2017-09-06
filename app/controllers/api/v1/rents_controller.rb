module Api
  module V1
    class RentsController < ApiController
      before_action :set_locale, only: :create

      def index
        @rents = Rent.all
        render json: @rents
      end

      def create
        @rent = Rent.new(rent_params)
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

      def set_locale
        I18n.locale = current_user.locale || I18n.default_locale
      end
    end
  end
end
