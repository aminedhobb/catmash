require 'rails_helper'

RSpec.describe Cat, type: :model do

  let!(:my_cat) do
    Cat.create!(
      auid: '111-222',
      url: 'http://kittykitty.miaw'
    )
  end

  context 'is valid' do

    it 'if all required infos are given' do
      expect(my_cat).to be_valid
    end
  end

  context 'is invalid' do
    it 'if no url is given' do
      my_cat.url = nil
      expect(my_cat).to_not be_valid
    end

    it 'if no auid is given' do
      my_cat.auid = nil
      expect(my_cat).to_not be_valid
    end

    it 'if url is already taken' do
      new_cat = Cat.new(auid: 'aabbcc', url: 'http://kittykitty.miaw')
      expect(new_cat).to_not be_valid
    end

    it 'if auid is already taken' do
      new_cat = Cat.new(auid: '111-222', url: 'http://mynewcat.awesome')
      expect(new_cat).to_not be_valid
    end
  end
end
