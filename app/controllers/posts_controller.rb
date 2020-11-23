class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def new
    @post = Post.new
    end

    def create
    @post = Post.create(post_params)
        
        if @post.valid?
        redirect_to post_path(@post)
        else
        flash[:post_errors] = @post.errors.full_messages
        redirect_to new_post_path
        end

    end

    private

    def post_params
     params.require(:post).permit(:title, :content, :likes, :blogger_id, :destintation_id)   
    end
end

