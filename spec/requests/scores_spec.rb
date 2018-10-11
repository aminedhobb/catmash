require 'rails_helper'

RSpec.describe ScoresController do

  describe 'GET index' do

    it 'assign all cats' do
      my_cat = FactoryBot.create(:cat)
      get '/scores'
      expect(response.status).to eq(200)
      expect(assigns(:cats)).to eq([my_cat])
    end

    it 'renders the index template' do
      get '/scores'
      expect(response).to render_template('index')
    end
  end

  describe 'PATCH update' do

    it 'updates the score' do
      cat1 = FactoryBot.create(:cat)
      cat2 = FactoryBot.create(:cat)
      patch '/scores', params: { cats_id: "#{cat1.id} #{cat2.id}", selected_cat_id: cat1.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
