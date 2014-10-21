class Book < ActiveRecord::Base
  has_many :user_books

  validates :course, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :ISBN, presence: true


  def self.search(query)
    where(
      "course ilike ? OR title ilike ? OR author ilike ? OR isbn ilike ?",
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
      )
  end
end
