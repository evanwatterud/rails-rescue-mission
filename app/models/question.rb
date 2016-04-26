class Question < ActiveRecord::Base
  has_many :answers

  validates :title, :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
end
