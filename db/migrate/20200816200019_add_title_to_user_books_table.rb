class AddTitleToUserBooksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :user_books, :title, :string
  end
end
