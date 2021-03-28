class OmikujisController < ApplicationController
  def index
    @omikujis = Omikuji.all
  end

  def create
    omikuji = Omikuji.new(omikuji_params)
    omikuji.user_id = user_info['id']
    omikuji.save!

    redirect_to omikujis_path
  end

  def omikuji_params
    params.require(:omikuji).permit(:name)
  end
end
