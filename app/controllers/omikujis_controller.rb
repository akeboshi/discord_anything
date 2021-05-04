class OmikujisController < ApplicationController
  before_action :set_omikuji, only: :destroy

  def index
    @omikujis = Omikuji.all
    pp logged_in_user.guilds if logged_in?
  end

  def create
    omikuji = Omikuji.new(omikuji_params)
    omikuji.user = logged_in_user
    omikuji.save!

    redirect_to omikujis_path, notice: "#{omikuji.name} を作成しました！"
  end

  def destroy
    @omikuji.destroy

    redirect_to omikujis_path, notice: 'おみくじの削除に成功しました'
  end

  private

  def omikuji_params
    params.require(:omikuji).permit(:name)
  end

  def set_omikuji
    @omikuji = Omikuji.find(params[:id])
  end
end
