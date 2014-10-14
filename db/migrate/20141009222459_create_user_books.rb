class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.references :user, index: true, null: false
      t.string :title, null: false
      t.string :author, null: false
      t.string :condition, null: false
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
