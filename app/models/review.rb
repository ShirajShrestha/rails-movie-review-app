class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  scope :ordered, -> { order(id: :desc) }
end
