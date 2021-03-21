module UserStatus
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in?
    helper_method :user_info

    def logged_in?
      session[:user].present?
    end

    def logged_in_with_discord(auth_hash)
      pp auth_hash
      user = {
        discord_id: auth_hash[:uid],
        name: auth_hash[:info][:name],
        image_url: auth_hash[:info][:image]
      }
      session[:user] = user
    end

    def user_info
      session[:user]
    end
  end
end
