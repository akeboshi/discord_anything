class DayOmikuji < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :discord_id, presence: true, uniqueness: true, length: {maximum: 50}
end
