class CatsController < ApplicationController

  def index
    @cats = Cat.all.sample(2)
  end
end
