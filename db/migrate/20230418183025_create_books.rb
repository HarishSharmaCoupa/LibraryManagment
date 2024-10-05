class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :name
      t.integer :isbn
      t.string :author
      t.datetime :year
      t.text :description
    end
  end
end
