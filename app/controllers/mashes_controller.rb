class MashesController < ApplicationController

  def index
    @cats = Cat.all.sample(2)
    @cat1 = @cats[0]
    @cat2 = @cats[1]
  end
end
