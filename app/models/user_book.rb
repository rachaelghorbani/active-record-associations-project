class UserBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  # def destroy_user_book
  #   to_destroy = UserBook.find(self.id)
  #   to_destroy.destroy
  # end
end