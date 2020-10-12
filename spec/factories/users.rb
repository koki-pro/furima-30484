FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_reading { 'ヤマダ' }
    last_name_reading { 'タロウ' }
    birth_day { Faker::Date.birthday }
  end
end
