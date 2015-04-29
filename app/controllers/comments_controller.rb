class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_url(@post), change: 'comments'
    else
      redirect_to post_url(@post), change: 'new_comment'
    end
  end

  def destroy
  end

  private
    def set_post
      @post = Post.find(comment_params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :name, :body)
    end
end
