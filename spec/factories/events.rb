# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "Test Event"
    details "This is a test event, to test the intricacies of the event management app."
    logo_url "http://www.audiofixx.com/wp-content/uploads/2012/06/Uplighting3-300x200.jpg"
    start_date "2014-07-14"
    start_time "04:06:53"
    end_date "2014-08-24"
    end_time "08:06:53"
    address "60/45, 6th Cross, Cambridge Layout"
    city "Bangalore"
    zipcode "560008"
    category "Business"
    is_private false
    user_id 1
  end
end
