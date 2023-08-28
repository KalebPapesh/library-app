FactoryBot.define do
  factory :circulation do
    book_id { "MyString" }
    patron_id { "MyString" }
    return_date { "2023-08-27" }
    timestamp { "2023-08-27" }
    action_type { "MyString" }
  end
end
