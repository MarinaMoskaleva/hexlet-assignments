class Posts::CommentsController < ApplicationController
  before_action :set_post, only: %i[ create ]
  before_action :set_post_comment, only: %i[ edit update destroy]

  # def new
  #   @comment = @post.post_comments.build
  # end

  def edit
  end

  def create
    @comment = @post.post_comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(@post), notice: 'Something went wrong.'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = @comment.post
    p post.inspect
    
    @comment.destroy
    redirect_to post_path(post), notice: "Comment was successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_comment
    @comment = PostComment.find(params[:id])
  end

  def comment_params
    params.require(:post_comment).permit(:body)
  end

end
