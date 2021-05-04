module DiscordInfo
  extend ActiveSupport::Concern

  included do
    def servers(user)
      Discordrb::API::User.servers("Bearer #{user.token}")
    rescue => e
      puts e.message
    end
  end
end
