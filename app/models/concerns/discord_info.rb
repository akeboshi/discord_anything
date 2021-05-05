module DiscordInfo
  extend ActiveSupport::Concern

  included do
    def servers(user_token)
      JSON.parse(Discordrb::API::User.servers("Bearer #{user_token}")).map { |s| DiscordServer.new(s) }
    rescue StandardError => e
      puts e.message
      []
    end
  end

  class DiscordServer
    attr_reader :id, :name, :owner, :permissions, :features, :permission_new

    def initialize(server)
      server.tap do |s|
        @id = s['id']
        @name = s['name']
        @owner = s['owner']
        @permissions = s['permissions']
        @features = s['features']
        @permissions_new = s['permissions_new']
      end
    end
  end
end
