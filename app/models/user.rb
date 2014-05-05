class User < ActiveRecord::Base
has_many :events
has_many :photos, through: :events
end