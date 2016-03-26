require 'rails_helper'

RSpec.describe EveItem, type: :model do
  describe "get" do
    it "is nil when not found" do
      expect(EveItem.get(nil)).to be_nil
      expect(EveItem.get(1)).to be_nil
    end

    it "finds eve items" do
      eve_item = create :eve_item
      expect(EveItem.get(eve_item.type_id)).to eq eve_item
    end
  end
end