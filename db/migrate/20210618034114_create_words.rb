class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.integer :author_id
      t.json :title
      t.timestamps
    end
  end
end
