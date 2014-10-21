class RemoveColumnsFromUserBooks < ActiveRecord::Migration
  def change
    remove_column :user_books, :title
    remove_column :user_books, :author
  end
end
