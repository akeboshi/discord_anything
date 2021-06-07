class CustomResponse < ApplicationRecord
  belongs_to :user

  validates :key, presence: true, length: {maximum: 255}
  validates :response, presence: true, length: {maximum: 1000}
end
