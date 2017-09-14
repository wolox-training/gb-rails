FactoryGirl.define do
  factory :book_suggestion do
    author    { Faker::Book.author }
    editorial { Faker::Ancient.hero }
    link      { Faker::Internet.url }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year      { Faker::Date.backward }
    price     { Faker::Number.decimal(2) }
  end
end
