class OmikujisController < ApplicationController
  def index
    @omikujis = Omikuji.all
  end

  def create
    Omikuji.create(omikuji_params)
  end

  def omikuji_params
    params.require(:omikuji).permit(:name)
  end
end
