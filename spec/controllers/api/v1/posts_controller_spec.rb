require 'rails_helper'

describe Api::V1::PostsController, type: :controller do
  before(:all) do
    Post.delete_all
    Post.create!(title: 'first post', body: 'body first post')
    Post.create!(title: 'second post', body: 'body second post')
  end

  describe 'index' do
    it 'with default paging' do
      get :index
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end

    it 'with paging' do
      get :index, params: { page: 2, per_page: 1 }
      json = JSON.parse(response.body)
      expect(json[0]['title']).to eq(Post.last.title)
    end
  end

  it :create do
    expect {
      post :create, params: { title: 'third post', body: 'body third post' }
    }.to change(Post, :count).by(1)
  end

  it :show do
    post = Post.first
    get :show, params: { id: post.id }
    json = JSON.parse(response.body)
    expect(json['title']).to eq(post.title)
  end
end
