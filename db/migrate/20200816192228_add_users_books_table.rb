class AddUsersBooksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books do |t|
      t.string :due_date
      t.boolean :returned
      t.boolean :overdue
      t.belongs_to :user
      t.belongs_to :book
    end
  end
end
