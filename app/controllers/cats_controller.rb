class CatsController < ApplicationController

  def index
    @cats = Cat.order(score: :desc)
  end
end
