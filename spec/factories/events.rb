FactoryGirl.define do
	factory :event do |f|
		f.name "John Doe"
		f.description "This is a Valid event"
		f.event_date "1999-09-09"
	end

	factory :invalid_event, class: Event do |f|
		f.name nil
	end
end

