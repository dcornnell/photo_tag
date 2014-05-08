require 'spec_helper'

describe Comment do
	it 'should be invalid without content' do
		c = Comment.new
		c.should_not be_valid
	end

	
end