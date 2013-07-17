# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name "Front Row Seats"
    description "Front row seats including complementary meal."
    price 250
    quantity 100
    sales_start_datetime "2014-07-05 05:13:00"
    sales_end_datetime "2014-08-05 05:13:00"
    event_id 1
  end
end
