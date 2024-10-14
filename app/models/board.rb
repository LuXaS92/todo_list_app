class Board < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :tasks, through: :steps
end
