class Board < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :tasks, through: :steps

  validates :title, presence: true, length: {maximum: 255}
end
