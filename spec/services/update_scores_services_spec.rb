require 'rails_helper'

RSpec.describe UpdateScoresService do

  let!(:cat1) do
    FactoryBot.create(:cat)
  end

  let!(:cat2) do
    FactoryBot.create(:cat)
  end

  let(:score1) { cat1.score }
  let(:score2) { cat2.score }

  let(:params) do
    {
      cats_id: "#{cat1.id} #{cat2.id}",
      selected_cat_id: "#{cat1.id}"
    }
  end

  let(:expected_score1) do
    1016
    # 1000 + (32 * (1 - (1 / (1 + (10**((1000 - 1000) / 400.0))))))
  end

  let(:expected_score2) do
    984
    # 1000 + (32 * (0 - (1 / (1 + (10**((1000 - 1000) / 400.0))))))
  end

  let(:service) do
    described_class.new(params)
  end

  context 'when not called' do
    it 'does not update the scores' do
      expect(cat1.reload.score).to eq(score1)
      expect(cat2.reload.score).to eq(score2)
    end
  end

  context 'when called' do
    it 'updates the scores' do
      service.call
      cat1.reload
      cat2.reload
      expect(cat1.score).to eq(1016)
      expect(cat2.score).to eq(984)
    end

    it 'sets negative values to zeros' do
      cat2.update(score: 0)
      service.call
      cat2.reload
      expect(cat2.score).to eq(0)
    end
  end
end
