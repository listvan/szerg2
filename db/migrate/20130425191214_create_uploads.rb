class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :path
      t.string :name
      t.integer :size
      t.string :content_type
      t.string :file
      t.integer :user_id

      t.timestamps
    end
  end
end
