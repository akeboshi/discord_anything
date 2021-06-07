class Omikuji < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}

  scope :random, -> { offset(rand(count)).limit(1).first }

  def self.random_by_discord_id(discord_id)
    day = DayOmikuji.find_by(discord_id: discord_id, updated_at: Time.zone.now.all_day)
    return day.name if day.present?

    omikuji_day = DayOmikuji.find_or_initialize_by(discord_id: discord_id)
    omikuji_day.name = random.name
    omikuji_day.save!

    omikuji_day.name
  end
end
