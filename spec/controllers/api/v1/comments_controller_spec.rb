require 'rails_helper'

describe Api::V1::CommentsController, type: :controller do
  before(:all) do
    Comment.delete_all
    Comment.create!(body: 'first comment')
    Comment.create!(body: 'second comment')
    Comment.create!(body: 'third comment')
  end

  it :index do
    get :index
    json = JSON.parse(response.body)
    expect(json.size).to eq(3)
  end
end
