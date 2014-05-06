class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :user_id
    	t.string :content
    	t.integer :commentable_id
    	t.string :commentable_type
    end
  end
end
