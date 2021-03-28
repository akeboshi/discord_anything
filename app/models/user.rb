class User < ApplicationRecord
  has_many :omikujis

  validates :name, presence: true
  validates :discord_id, presence: true
  validates :image_url, presence: true
end
