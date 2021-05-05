class User < ApplicationRecord
  include DiscordInfo
  has_many :omikujis

  validates :name, presence: true
  validates :discord_id, presence: true, uniqueness: true
  validates :image_url, presence: true

  def guilds
    raise 'tokenがある状態で取得して下さい' unless token

    servers(token)
  end

  def asakusa?
    a = guilds.map(&:id).include? Constants::ASAKUSA_ID
    pp a
    a
  end
end
