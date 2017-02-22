module Api::V1
  class PostsController < ApiController
    def index
      page = params[:page] || 1
      per_page = params[:per_page] || Kaminari.config[:default_per_page]

      posts = Post.page(page).per(per_page)
      total_page = Post.page(page).per(per_page).total_pages
      total_records = Post.all.size
      
      response.headers['X-Total-Pages'] = total_page
      response.headers['X-Total-Records'] = total_records

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
