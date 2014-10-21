class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user, presence: true
  validates :book, presence: true
  validates :condition, presence: true
  validates :price, presence: true
end
