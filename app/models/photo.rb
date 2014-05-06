class Photo < ActiveRecord::Base
has_and_belongs_to_many :tags
belongs_to :event
mount_uploader :image, ImageUploader
has_many :comments, as: :commentable
accepts_nested_attributes_for :tags
end