class Category < ActiveRecord::Base
  has_many :books
  has_many :authors, through: :books

def self.all_categories
  
  Category.all.map do |category|
    "#{category.id}. #{category.name}"
  end
end


end