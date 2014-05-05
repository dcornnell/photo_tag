class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :image
    	t.integer :event_id
    	t.string :name
    	t.date :photo_date
    end
  end
end
