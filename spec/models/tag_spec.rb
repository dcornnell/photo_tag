require 'spec_helper'

describe Tag do
	it 'should be invalid without a name' do
		t = Tag.new
		t.should_not be_valid
	end

	it 'should be invalid if the name is longer than 15 character' do
		 t = Tag.new name: "this is longer than 15 characters"
	
		t.should_not be_valid
	end
end