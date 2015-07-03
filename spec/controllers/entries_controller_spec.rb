require 'rails_helper'
RSpec.describe EntriesController, type: :controller do
  describe '#GET new' do
    it 'assigns @entries' do
      entry = FactoryGirl.create(:entry)
      get :new
      expect(assigns(:entries)).to eq([entry])
    end

    it 'assigns @entry' do
      get :new
      expect(assigns(:entry)).to be_a_kind_of(Entry)
    end
  end

  describe '#POST create' do
    it 'creates a new entry' do
      params = { entry: FactoryGirl.attributes_for(:entry) }
      expect { post :create, params }.to change(Entry, :count).by(1)
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#DELETE destroy' do
    it 'deletes an entry' do
      entry = FactoryGirl.create(:entry)
      expect { post :destroy, id: entry.id }.to change(Entry, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end
  end
end
