class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.integer :comment_id
    	t.string :name
    	t.string :email
    	t.text :content
    	t.timestamps
    end
  end
end
