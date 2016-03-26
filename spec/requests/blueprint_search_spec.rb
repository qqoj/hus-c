require 'rails_helper'

RSpec.describe "Blueprint search", type: :request do
  it "is available on the root path" do
    get root_path

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)

    post search_path, value: "Test"

    expect(response).to render_template(:index)
  end
end