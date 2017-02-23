require 'rails_helper'

describe Api::V1::CommentsController, type: :controller do
  before(:all) do
    user = create(:user)
    @auth_headers = user.create_new_auth_token
    create_list(:comment, 3)
  end

  it :index do
    get :index, params: @auth_headers
    json = JSON.parse(response.body)
    expect(json.size).to eq(3)
  end
end
