class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  def check_out(book, due_date)
    checkout = UserBook.find_by(due_date: due_date,
    overdue: false, user_id: self.id, book_id: book.id)
    if checkout == nil
      UserBook.create(due_date: due_date, overdue:false, user_id: self.id, book_id: book.id)
    else
      checkout.destroy
      UserBook.create(due_date: due_date, returned: false, overdue:false, user_id: self.id, book_id: book.id)
    end
  end


  def return_book(book)
    to_return = UserBook.find_by(user_id: self.id, book_id: book.id)
    to_return.returned = true
    to_return
  end

end

