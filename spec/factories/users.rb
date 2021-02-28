FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"山田"}
    first_name {"陸太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"リクタロウ"}
    date_of_birth {"2021-04-01"}
  end
end