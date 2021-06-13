class CustomResponsesController < ApplicationController
  before_action :set_custom_response, only: :destroy

  def index
    @custom_responses = CustomResponse.order(key: 'ASC').order(created_at: 'DESC')
  end

  def create
    unless logged_in?
      redirect_to custom_responses_path, alert: 'おみくじの削除に失敗しました'
      return
    end
    custom_response = CustomResponse.new(custom_response_params)
    custom_response.user = logged_in_user
    begin
      custom_response.save!
    rescue ActiveRecord::RecordInvalid => _e
      redirect_to custom_responses_path, alert: custom_response.errors.messages.map {|_, val| val}.join("\n")
      return
    end

    redirect_to custom_responses_path, notice: "#{custom_response.key} を作成しました！"
  end

  def destroy
    unless logged_in?
      redirect_to custom_responses_path, alert: 'おみくじの削除に失敗しました'
      return
    end
    @custom_response.destroy

    redirect_to custom_responses_path, notice: 'おみくじの削除に成功しました'
  end

  private

  def custom_response_params
    params.require(:custom_response).permit(:key, :response)
  end

  def set_custom_response
    @custom_response = CustomResponse.find(params[:id])
  end
end
