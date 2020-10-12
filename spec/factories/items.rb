FactoryBot.define do
  factory :item do
    name               { Faker::Name.name }
    introduction       { Faker::Lorem.sentence }
    category_id        { 2 }
    condition_id       {2}
    postage_payer_id   {2}
    prefecture_code_id {2}
    preparation_day_id {2}
    price              {300}

    association :user

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
