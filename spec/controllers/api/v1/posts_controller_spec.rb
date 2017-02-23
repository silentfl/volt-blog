require 'rails_helper'

describe Api::V1::PostsController, type: :controller do
  before(:all) do
    user = create(:user)
    @auth_headers = user.create_new_auth_token
    create_list(:post, 5)
  end

  describe 'index' do
    it 'with default paging' do
      get :index, params: @auth_headers
      json = JSON.parse(response.body)
      expect(json.size).to eq([Post.all.size, Kaminari.config[:default_per_page]].min)
    end

    it 'with paging' do
      get :index, params: { page: 2, per_page: 2 }.merge(@auth_headers)
      json = JSON.parse(response.body)
      expect(json[0]['title']).to eq(Post.order(published_at: :desc).offset(2).first.title)
    end

    it 'order' do
      get :index, params: @auth_headers
      json = JSON.parse(response.body)
      expect(json[0]['title']).to eq(Post.order(published_at: :desc).first.title)
    end
  end

  it :create do
    expect {
      post :create, params: { title: 'third post', body: 'body third post' }.merge(@auth_headers)
    }.to change(Post, :count).by(1)
  end

  it :show do
    post = Post.first
    get :show, params: { id: post.id }.merge(@auth_headers)
    json = JSON.parse(response.body)
    expect(json['title']).to eq(post.title)
  end
end
