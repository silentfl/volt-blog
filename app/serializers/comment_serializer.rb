class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :published_at
end
