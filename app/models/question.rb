class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  attr_accessible :content

  validates :content, presence: true
end
