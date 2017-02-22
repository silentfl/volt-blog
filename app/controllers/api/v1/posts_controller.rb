module Api::V1
  class PostsController < ApiController
    def index
      posts = Post.all

      render json: posts
    end

    def create
      post = Post.create(create_params)
      post.published_at = Time.now unless post.published_at
      if post.save
        render json: post
      else
        render json: { errors: post.errors }
      end
    end

    def show
      post = Post.find_by(id: params[:id])
      if post
        render json: post
      else
        render json: { errors: ['not found'] }, status: 404
      end
    end

    private

    def create_params
      params.permit(:title, :body, :published_at)
    end
  end
end
