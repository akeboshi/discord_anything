class Api::CustomResponsesController < ApplicationController
  def words
    if params[:word].blank?
      render json: { words: [] }
      return
    end

    words = CustomResponse.all
                          .filter { |r| r.key.include?(params[:word]) }
                          .map(&:response)
    render json: { words: words }
  end
end
