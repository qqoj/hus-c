require 'rails_helper'

RSpec.describe Blueprint, type: :model do
  describe "materials" do
    it "can be missing" do
      expect(build(:blueprint, activities: {}).materials).to eq []
    end

    it "are found from activities" do
      expect(build(:blueprint, activities: {
          manufacturing: {materials: [1, 2, 3]}
      }).materials).to eq [1, 2, 3]
    end
  end

  describe "cost" do
    it "uses materials" do
      create :eve_item, type_id: 1, price: 1.1
      create :eve_item, type_id: 2, price: 1.2
      create :eve_item, type_id: 3, price: 1.3
      create :eve_item, type_id: 5, price: 100

      blueprint = build(:blueprint)
      materials = [
          {typeID: 1, quantity: 2},
          {typeID: 2, quantity: 1},
          {typeID: 3, quantity: 3},
          {typeID: 4, quantity: 1},
          {typeID: 5, quantity: 0},
      ]
      allow(blueprint).to receive(:materials).and_return materials
      expect(blueprint.cost).to eq 7.3
    end
  end

  describe "products" do
    it "can be missing" do
      expect(build(:blueprint, activities: {}).products).to eq []
    end

    it "are found from activities" do
      expect(build(:blueprint, activities: {
          manufacturing: {products: [1, 2, 3]}
      }).products).to eq [1, 2, 3]
    end
  end

  describe "sell_for" do
    it "uses products" do
      create :eve_item, type_id: 1, price: 1.1
      create :eve_item, type_id: 2, price: 1.2
      create :eve_item, type_id: 3, price: 1.3
      create :eve_item, type_id: 5, price: 100

      blueprint = build(:blueprint)
      products = [
          {typeID: 1, quantity: 2},
          {typeID: 2, quantity: 1},
          {typeID: 3, quantity: 3},
          {typeID: 4, quantity: 1},
          {typeID: 5, quantity: 0},
      ]
      allow(blueprint).to receive(:products).and_return products
      expect(blueprint.sell_for).to eq 7.3
    end
  end
end
