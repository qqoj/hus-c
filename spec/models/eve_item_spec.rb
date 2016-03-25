require 'rails_helper'

RSpec.describe EveItem, type: :model do
  describe "get" do
    before :each do
      @eve_item = create :eve_item
    end

    it "is nil when not found" do
      expect(EveItem.get(nil)).to be_nil
      expect(EveItem.get("")).to be_nil
    end

    it "typeID from hash" do
      expect(EveItem.get({typeID: 1}.stringify_keys)).to eq(@eve_item)
    end

    it "type_id method" do
      expect(EveItem.get(build(:blueprint, type_id: 1))).to eq(@eve_item)
    end
  end
end