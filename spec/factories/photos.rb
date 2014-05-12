FactoryGirl.define do
	factory :photo do |f|
		f.name {Faker::Name.name}  
		f.image "image string"
		f.photo_date "1999-09-09"
	end

	factory :invalid_photo, class: Photo do |f|
		f.name nil
		f.photo_date nil
	end
end



