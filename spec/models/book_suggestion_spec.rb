require 'rails_helper'

describe BookSuggestion do
  it do
    should validate_presence_of(:author)
  end
  it do
    should validate_presence_of(:link)
  end
  it do
    should validate_presence_of(:title)
  end

  subject(:book_suggestion) do
    BookSuggestion.new(
      author: author, title: title, price: price,
      publisher: publisher, year: year, link: link, editorial: editorial
    )
  end

  let(:author)    { Faker::Book.author }
  let(:editorial) { Faker::Ancient.hero }
  let(:link)      { Faker::Internet.url }
  let(:title)     { Faker::Book.title }
  let(:publisher) { Faker::Book.publisher }
  let(:year)      { Faker::Date.backward }
  let(:price)     { Faker::Number.decimal(2) }

  it do
    is_expected.to be_valid
  end
end
