class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: { :message => "Answer can't be blank" }
  validates :description, length: { minimum: 20, :message => "Answer is too short, must be at least 20 characters" }
end
