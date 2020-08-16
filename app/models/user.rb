class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  def check_out(book, due_date)
    checkout = UserBook.find_or_create_by(due_date: due_date, returned: false, overdue: false, user_id: self.id, book_id: book.id)
  end

  def return_book(book)
    to_return = UserBook.find_by(user_id: self.id, book_id: book.id, returned: false)
    to_return.returned = true
    to_return.save
  end

end

