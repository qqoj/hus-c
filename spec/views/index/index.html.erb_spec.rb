require 'rails_helper'

RSpec.describe "index/index", type: :view do
  before(:each) do
    assign(:blueprints, [create(:blueprint, name: 'Test A'), create(:blueprint, name: 'Test B')])
  end

  it "renders the blueprint search form" do
    render
    assert_select "form[action=?][method=?]", search_path, "post" do
      assert_select "textarea#value[name=?]", "value"
      assert_select "input[type=?][name=?]", "submit", "commit"
    end
  end

  it "renders a list of blueprints" do
    render
    assert_select "tr>td", text: "1 x Test A", count: 1
    assert_select "tr>td", text: "1 x Test B", count: 1
  end
end