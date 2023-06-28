class Subject < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :body, presence: true
end
