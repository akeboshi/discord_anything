class User < ApplicationRecord
  include DiscordInfo
  has_many :omikujis

  validates :name, presence: true
  validates :discord_id, presence: true, uniqueness: true
  validates :image_url, presence: true

  def guilds
    unless discord_id
      raise "discord idがある状態で取得して下さい"
    end

    servers(self)
  end
end
