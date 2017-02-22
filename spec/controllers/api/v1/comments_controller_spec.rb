require 'rails_helper'

describe Api::V1::CommentsController, type: :controller do
  before(:all) do
    User.delete_all
    user = User.create!(
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password',
      nickname: 'user'
    )
    user.confirm
    @auth_headers = user.create_new_auth_token

    Comment.delete_all
    Comment.create!(body: 'first comment')
    Comment.create!(body: 'second comment')
    Comment.create!(body: 'third comment')
  end

  it :index do
    get :index, params: @auth_headers
    json = JSON.parse(response.body)
    expect(json.size).to eq(3)
  end
end
