class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :subject
  validates :text, presence: true
end
