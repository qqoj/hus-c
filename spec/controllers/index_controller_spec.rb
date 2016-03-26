require 'rails_helper'

RSpec.describe IndexController, type: :controller do

  describe "GET #index" do
    it "renders the 'index' template" do
      get :index, {}
      expect(response).to render_template(:index)
    end
  end

  describe "POST #search" do
    it "may find no blueprints" do
      post :search, {value: "Test"}
      expect(assigns(:blueprints)).to eq []
    end

    it "assigns found blueprints as @blueprints" do
      blueprint = create(:blueprint, name: 'Test')
      post :search, {value: "Test Blueprint"}
      expect(assigns(:blueprints)).to eq [blueprint]
    end

    it "finds blueprints even when 'Blueprint' is missing for the query" do
      blueprint = create(:blueprint, name: 'Test')
      post :search, {value: "Test"}
      expect(assigns(:blueprints)).to eq [blueprint]
    end

    it "finds multiple blueprints" do
      blueprint_1 = create(:blueprint, name: 'Test A')
      blueprint_2 = create(:blueprint, name: 'Test B')
      post :search, {value: "Test A Blueprint\nTest B Blueprint"}
      expect(assigns(:blueprints)).to eq [blueprint_1, blueprint_2]
    end

    it "parses blueprint names from tabbed inputs" do
      blueprint_1 = create(:blueprint, name: 'Test A')
      blueprint_2 = create(:blueprint, name: 'Test B')
      post :search, {value: "Test A Blueprint\t1\t2\nTest B Blueprint\t1\t2"}
      expect(assigns(:blueprints)).to eq [blueprint_1, blueprint_2]
    end
  end
end