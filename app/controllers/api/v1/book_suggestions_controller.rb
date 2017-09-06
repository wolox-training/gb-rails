module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_request

      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_params)
        @book_suggestion.user_id = current_user.try(:id) || nil
        if @book_suggestion.save
          render json: @book_suggestion, status: :created
        else
          render json: { errors: @book_suggestion.errors }, status: :bad_request
        end
      end

      def book_suggestion_params
        params.require(:book_suggestion)
              .permit(:user_id, :author, :link, :year, :publisher, :editorial, :price, :title)
      end
    end
  end
end
