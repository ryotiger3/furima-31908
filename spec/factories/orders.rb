FactoryBot.define do
  factory :order do
    token          {'tok_abcdefghijk00000000000000000'}
    prefecture_id  {4}
    post_code      {'123-4567'}
    address        {'1-1-1'}
    city           {'釜石市'}
    building_name  {'テックビル'}
    phone_number   {'08092198479'} 
  end
end
