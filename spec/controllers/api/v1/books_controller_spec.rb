require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with the users rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(books).to_json
        expect(JSON.parse(@response.body)).to eq JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the user rent json' do
        expect(JSON.parse(@response.body)).to eq JSON.parse(
          BookShowSerializer.new(book, root: false).to_json
        )
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
