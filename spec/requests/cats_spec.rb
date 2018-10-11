require 'rails_helper'

RSpec.describe CatsController do

  describe 'GET index' do

    it 'assign @cats' do
      cat1 = FactoryBot.create(:cat)
      cat2 = FactoryBot.create(:cat)
      get '/cats'
      expect(response.status).to eq(200)
      expect(assigns(:cats)).to include(cat1, cat2)
    end

    it 'renders the index template' do
      get '/cats'
      expect(response).to render_template('index')
    end
  end
end
