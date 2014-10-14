class UserBook < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :condition, presence: true
end
