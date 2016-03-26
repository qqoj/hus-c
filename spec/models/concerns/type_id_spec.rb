RSpec.shared_examples "type_id" do
  it "from raw value" do
    expect(subject.class.type_id(1)).to eq 1
  end

  it "from hash" do
    expect(subject.class.type_id({typeID: 1})).to eq 1
  end

  it "from blueprint" do
    expect(subject.class.type_id(build(:blueprint, type_id: 1))).to eq 1
  end
end

class TestTypeId
  include TypeId
end

RSpec.describe TestTypeId do
  it_behaves_like "type_id"
end