class SessionsController < ApplicationController
  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only.
  skip_before_action :verify_authenticity_token, only: :callback

  def callback
    logged_in_with_discord(auth_hash)
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
