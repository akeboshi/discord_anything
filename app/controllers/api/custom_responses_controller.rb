class Api::CustomResponsesController < ApplicationController
  def words
    if params[:word].blank?
      render json: { words: [] }
      return
    end

    words = CustomResponse.all
                          .filter { |r| params[:word].include?(r.key) }
                          .group_by { |r| r.key }
                          .map{ |_, r| r[rand(r.length)]}
                          .map(&:response)
    render json: { words: words }
  end
end
