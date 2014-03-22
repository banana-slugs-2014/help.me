require 'spec_helper'

describe PlacesController do
  describe "#index" do
    it {expect(get :index).to be_ok}
  end

  describe '#create' do
    let!(:place){ create :place }

    it 'initializes places without creating new ones' do
      expect{
        post :create, :places => [attributes_for(:place)].to_json
        expect(response).to be_redirect
      }.to_not change{ Place.count }
    end

    it 'assigns the @places var' do
      post :create, :places => [attributes_for(:place)].to_json
      expect(assigns(:places)[0]).to be_a_new Place
    end
  end
end