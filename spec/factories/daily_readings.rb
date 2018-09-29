FactoryGirl.define do
  factory :daily_reading do |f|
    f.reading "100"
    f.person_id 3
    f.date_done "2018-09-29 00:00:00"
  end
end