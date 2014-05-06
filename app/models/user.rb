class User < ActiveRecord::Base
has_many :events
has_many :photos, through: :events
has_many :comments
end