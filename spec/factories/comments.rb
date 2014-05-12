FactoryGirl.define do
	factory :comment do |f|
		f.content {Faker::Lorem.sentence(3)}
	end

	factory :invalid_comment, class: Event do |f|
		f.contents nil
	end
end