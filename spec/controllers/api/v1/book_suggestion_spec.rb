require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'

  describe 'POST #create' do
    subject { post :create, params: book_suggestion_params }
    let(:book_suggestion_params) { { book_suggestion: new_book_suggestion_attributes } }

    context 'When creating a valid user book suggestion' do
      let!(:new_book_suggestion_attributes) do
        attributes_for(:book_suggestion).merge(user_id: user.id)
      end

      it 'creates a new book suggestion' do
        expect { subject }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid user book suggestion' do
      let!(:new_book_suggestion_attributes) { attributes_for(:book_suggestion).except(:author) }
      before do
        subject
      end

      it 'returns error messages' do
        expect(response.body['errors']).to be_present
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'doesn\'t create a new book suggestion' do
        expect { subject }.to change { BookSuggestion.count }.by(0)
      end
    end
  end
end
