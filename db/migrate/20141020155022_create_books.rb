class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :course, null: false
      t.string :ISBN, null: false
      t.string :title, null: false
      t.string :author, null: false

      t.timestamps
    end
  end
end
