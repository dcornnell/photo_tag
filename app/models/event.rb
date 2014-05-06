class Event < ActiveRecord::Base
has_many :photos
belongs_to :user
has_many :comments, as: :commentable
end