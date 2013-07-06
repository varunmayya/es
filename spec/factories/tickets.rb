# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name "MyString"
    description "MyString"
    price 1
    quantity 1
    sales_start_datetime "2013-07-05 05:13:00"
    sales_end_datetime "2013-07-05 05:13:00"
    event_id 1
  end
end
