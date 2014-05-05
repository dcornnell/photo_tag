class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :description
    	t.date :event_date
    end
  end
end
