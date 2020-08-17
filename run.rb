require_relative './config/environment'
require 'sinatra/activerecord/rake'

def run
  puts "Hello there! Can I please have your first name?"
  name = gets.chomp
  user = User.find_or_create_by(name: name)
  binding.pry
  puts "Hi #{name}! We have books in the following categories, select a number to see all the books in that category."
  puts Category.all_categories
  input = gets.chomp.to_i
  Book.books_by_category(input)
  puts "Which book would you like to check out today? Please enter the title below"
  book_title = gets.chomp
  due_date = (Time.now + (2*7*24*60*60)).to_s[0..9]
  book = Book.find_by(title: book_title)
  user.check_out(book, due_date)
  puts "Great! You Just checked out the following book. It's due back on #{due_date}"
  puts "#{book.title} by #{book.author.name}"
  
  puts "Which book would you like to return today? Please enter the title below."
  book = gets.chomp
  user.return_book(book)
  user.books.map do |book|
    puts book.title
  end
end

run