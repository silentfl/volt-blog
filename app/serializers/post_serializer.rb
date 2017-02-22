class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_at 
  #TODO author_nickname
end
