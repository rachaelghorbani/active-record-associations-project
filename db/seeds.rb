require "faker"

Author.destroy_all
Book.destroy_all
Category.destroy_all
User.destroy_all
UserBook.destroy_all

5.times do 
  Author.create(
    name: Faker::Name.first_name
  )
end
5.times do 
  Book.create(
  title: Faker::Book.title,
  author_id: Faker::Number.between(from: 1, to: 5), 
  category_id: Faker::Number.between(from: 1, to: 2) 
  )
end

2.times do 
  Category.create(
    name: Faker::Book.genre
  )
end
5.times do
  User.create(
    name: Faker::Name.first_name
  ) 
end

5.times do
  UserBook.create(
    due_date: Faker::Date.in_date_period,
    returned: true,
    overdue: false,
    user_id: Faker::Number.between(from: 1, to: 5),
    book_id: Faker::Number.between(from: 1, to: 5)
  )
end