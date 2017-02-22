module Api::V1
  class CommentsController < ApiController
    def index
      comments = Comment.all

      render json: comments
    end
  end
end
