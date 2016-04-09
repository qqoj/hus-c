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

  describe "materials_buy" do
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
      expect(blueprint.materials_buy).to eq 7.3
    end

    it "is affected by material_efficiency" do
      create :eve_item, type_id: 1, price: 1.1
      create :eve_item, type_id: 2, price: 1.2
      create :eve_item, type_id: 3, price: 1.3
      create :eve_item, type_id: 5, price: 100

      blueprint = build(:blueprint)
      blueprint.material_efficiency_percentage = 10
      materials = [
          {typeID: 1, quantity: 2},
          {typeID: 2, quantity: 1},
          {typeID: 3, quantity: 3},
          {typeID: 4, quantity: 1},
          {typeID: 5, quantity: 0},
      ]
      allow(blueprint).to receive(:materials).and_return materials
      expect(blueprint.materials_buy).to eq 6.57
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

  describe "products_sell" do
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
      expect(blueprint.products_sell).to eq 7.3
    end
  end

  describe "products_volume" do
    it "uses products" do
      create :eve_item, type_id: 1, volume: 0.1
      create :eve_item, type_id: 2, volume: 0.2
      create :eve_item, type_id: 3, volume: 0.3
      create :eve_item, type_id: 5, volume: 0.05

      blueprint = build(:blueprint)
      products = [
          {typeID: 1, quantity: 2},
          {typeID: 2, quantity: 1},
          {typeID: 3, quantity: 3},
          {typeID: 4, quantity: 1},
          {typeID: 5, quantity: 0},
      ]
      allow(blueprint).to receive(:products).and_return products
      expect(blueprint.products_volume).to eq 1.3
    end
  end

  describe "time" do
    it "can be missing" do
      expect(build(:blueprint, activities: {}).time).to eq 0
    end

    it "is found from activities" do
      expect(build(:blueprint, activities: {manufacturing: {time: 23000}}).time).to eq 23000
    end

    it "is affected by time_efficiency" do
      blueprint = build(:blueprint, activities: {manufacturing: {time: 23000}})
      blueprint.time_efficiency_percentage = 18
      expect(blueprint.time).to eq 18860
    end
  end

  describe "per_hour" do
    it "expects time to be in seconds" do
      blueprint = build(:blueprint)
      allow(blueprint).to receive(:time).and_return 3600
      expect(blueprint.per_hour 1).to eq 1
      allow(blueprint).to receive(:time).and_return 1200
      expect(blueprint.per_hour 1).to eq 3
    end

    it "is infinity if time is zero" do
      blueprint = build(:blueprint)
      allow(blueprint).to receive(:time).and_return 0
      expect(blueprint.per_hour 1).to eq 1/0.0 # Infinity
    end
  end

  describe "profit" do
    it "is the diff between products_sell and materials_buy" do
      blueprint = build(:blueprint)
      allow(blueprint).to receive(:products_sell).and_return 10
      allow(blueprint).to receive(:materials_buy).and_return 3
      expect(blueprint.profit).to eq 7
    end
  end

  describe "material_efficiency" do
    it "defaults to 1" do
      expect(build(:blueprint).material_efficiency).to eq(1)
    end

    it "can be lower than 1" do
      blueprint = build(:blueprint, material_efficiency_percentage: 10)
      expect(blueprint.material_efficiency).to eq(0.9)
    end
  end

  describe "time_efficiency" do
    it "defaults to 1" do
      expect(build(:blueprint).time_efficiency).to eq(1)
    end

    it "can be lower than 1" do
      blueprint = build(:blueprint, time_efficiency_percentage: 20)
      expect(blueprint.time_efficiency).to eq(0.8)
    end
  end
end
