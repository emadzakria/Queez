class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content

  validates :content, presence: true
end
