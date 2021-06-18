class CreateWordsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :words_categories do |t|
      t.integer :word_id
      t.integer :category_id
      t.timestamps
    end
  end
end
