require "rails_helper"

RSpec.describe IndexController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("index#index")
    end

    it "routes to #search" do
      expect(:post => "/").to route_to("index#search")
    end
  end
end