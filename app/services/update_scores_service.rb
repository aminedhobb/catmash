class UpdateScoresService

  def initialize(params)
    @winner = Cat.find(params[:selected_cat_id].to_i)
    @loser = Cat.find((params[:cats_id].split(' ') - [@winner.id.to_s]).first.to_i)
    @k = 32
    @errors = []
    @difference = @loser.score - @winner.score
  end

  def call
    calculate_scores

    @winner.update(score: @winner_new_score)
    @loser.update(score: @loser_new_score)

    self
  end

  private

  def calculate_scores
    @winner_new_score = @winner.score + (@k * (1 - expectations(@difference)))
    @loser_new_score = @loser.score - (@k * expectations(-@difference))
  end

  def expectations(difference)
    1 / (1 + 10**((difference / 400.0)))
  end
end
