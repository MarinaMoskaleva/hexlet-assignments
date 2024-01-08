class Web::Movies::CommentsController < Web::Movies::ApplicationController
  def index
    @comments = resource_movie.comments.order(id: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = resource_movie.comments.build(permitted_comment_params)

    if @comment.save
      redirect_to movie_comments_path(resource_movie), notice: t('success')
    else
      flash[:alert] = t('fail')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]

    if @comment.update(permitted_comment_params)
      redirect_to movie_comments_path(resource_movie), notice: t('success')
    else
      flash[:alert] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find params[:id]

    @comment&.destroy!

    redirect_to movie_comments_path(resource_movie), notice: t('success')
  end

  private

  def permitted_comment_params
    params.require(:comment).permit(:body)
  end
end