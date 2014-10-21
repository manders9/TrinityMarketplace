class AddNotNullToUserBooks < ActiveRecord::Migration
  def change
    change_column_null(:user_books, :book_id, false)
  end
end
