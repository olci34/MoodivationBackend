class AddSizeToWords < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :size, :integer
  end
end
