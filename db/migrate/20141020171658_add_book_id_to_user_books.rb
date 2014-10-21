class AddBookIdToUserBooks < ActiveRecord::Migration
  def change
    add_reference :user_books, :book, index: true, null: :false
  end
end
