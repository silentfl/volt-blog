require 'rails_helper'

describe Api::V1::PostsController, type: :controller do
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

    Post.delete_all
    Post.create!(title: 'first post', body: 'body first post', published_at: Time.now - 1.day)
    Post.create!(title: 'second post', body: 'body second post', published_at: Time.now)
  end

  describe 'index' do
    it 'with default paging' do
      get :index, params: @auth_headers
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end

    it 'with paging' do
      get :index, params: { page: 2, per_page: 1 }.merge(@auth_headers)
      json = JSON.parse(response.body)
      expect(json[0]['title']).to eq(Post.order(published_at: :desc).last.title)
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
