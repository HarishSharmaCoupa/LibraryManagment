class AddTimestampToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :created_at, :datetime
    add_column :books, :updated_at, :datetime
  end
end
