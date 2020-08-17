class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :user_books
  has_many :users, through: :user_books

  
  def self.books_by_category(input)
    books = Book.where("category_id = ?", input)
   books.map do |book|
    puts "#{book.title}, by #{book.author.name}"
   end
  end

end