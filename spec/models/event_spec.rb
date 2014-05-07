require 'spec_helper'

describe Event do
	it 'should be invalid without a name' do
		e = Event.new
		e.should_not be_valid
	end

	it 'should be scopable for the past month' do
		e1 = Event.new name: "my birthday", event_date: 2.days.ago
		e2 = Event.new name: "some past event", event_date: 4.months.ago
		e1.save
		e2.save
		Event.this_month.should eq([e1])
	end
end


	