class AddPriceToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :price, :decimal, precision: 8, scale: 2, null: false
  end
end
