module UserStatus
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in_user

    def logged_in?
      session[:user].present? && session[:user]['id'].present?
    end

    def logged_in_user(refresh: false)
      unless logged_in?
        @logged_in_user = nil
        return nil
      end

      @logged_in_user = User.find_by(id: session[:user]['id']) if refresh

      @logged_in_user ||= User.find_by(id: session[:user]['id'])
    end

    def logged_out
      session[:user] = nil
    end

    def logged_in_with_discord(auth_hash)
      user = User.find_or_initialize_by(discord_id: auth_hash[:uid])
      user.name = auth_hash[:info][:name]
      user.image_url = auth_hash[:info][:image]
      user.token = auth_hash[:credentials][:token]
      user.expires_at = auth_hash[:credentials][:expires_at]
      user.refresh_token = auth_hash[:credentials][:refresh_token]

      return nil unless user.asakusa?

      user.save!
      session[:user] = user

      user
    end

    def refresh!
      if logged_in_user.expires_at < Time.current.to_i
        oauth = OmniAuth::Strategies::Discord.new(
          nil,
          Constants::DISCORD_CLIENT_ID,
          Constants::DISCORD_CLIENT_SECRET
        )
        token = OAuth2::AccessToken.new(
          oauth.client,
          logged_in_user.token,
          { refresh_token: logged_in_user.refresh_token }
        )
        new_token = token.refresh!
        if new_token.present?
          logged_in_user.update(
            token: new_token.token,
            expires_at: new_token.expires_at,
            refresh_token: new_token.refresh_token
          )
        else
          puts("DAMN - DIDN'T WORK!")
        end
      end

      logged_in_user(refresh: true)
    end
  end
end
