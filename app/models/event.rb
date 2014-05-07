class Event < ActiveRecord::Base
has_many :photos
belongs_to :user
has_many :comments, as: :commentable
validates_presence_of :name
scope :this_month, -> {where('event_date > ?', 1.month.ago)}
end