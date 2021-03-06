class ScoresController < ApplicationController

  def index
    @cats = Cat.order(score: :desc)
  end

  def update
    UpdateScoresService.new(permited_hash).call
    redirect_to root_path
  end

  private

  def permited_hash
    permited_params.to_h.symbolize_keys
  end

  def permited_params
    params.permit(:cats_id, :selected_cat_id)
  end
end
