class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_url(@post), change: 'comments'
    else
      redirect_to post_url(@post), change: 'new_comment'
    end
  end

  def destroy
    post = Post.find_by(id: params[:post_id])
    post.comments.find_by(id: params[:id]).try(:destroy)
    render 'posts/_comments', locals: { comments: post.reload.comments }, change: 'comments'
  end

  private
    def set_post
      @post = Post.find(comment_params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :name, :body)
    end
end
