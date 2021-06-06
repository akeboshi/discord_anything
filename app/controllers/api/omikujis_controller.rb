class Api::OmikujisController < ApplicationController
  def random
    omikuji = Omikuji.random_by_discord_id(params[:user_id])
    render json: {name: omikuji}
  end
end
