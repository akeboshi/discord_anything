module UserStatus
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in?
    helper_method :user_info

    def logged_in?
      session[:user].present?
    end

    def logged_out
      session[:user] = nil
    end

    def user_info
      session[:user]
    end

    def logged_in_with_discord(auth_hash)
      session[:user] = User.create_with(
        name: auth_hash[:info][:name],
        image_url: auth_hash[:info][:image]
      ).find_or_create_by(discord_id: auth_hash[:uid])
    end
  end
end
