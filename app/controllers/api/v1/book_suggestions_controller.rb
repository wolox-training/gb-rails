module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_request, only: :create

      def create
        book_suggestion = BookSuggestion.new(book_suggestion_params
          .merge(user_id: current_user.try(:id)))
        if book_suggestion.save
          render json: book_suggestion, status: :created
        else
          render json: { errors: book_suggestion.errors }, status: :bad_request
        end
      end

      def book_suggestion_params
        params.require(:book_suggestion)
              .permit(:author, :link, :year, :publisher, :editorial, :price, :title)
      end
    end
  end
end
