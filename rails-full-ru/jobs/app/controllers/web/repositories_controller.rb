# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    @repository = Repository.new(permitted_params)

    if @repository.save
      RepositoryLoaderJob.perform_now(@repository)
      redirect_to @repository, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @repository = Repository.find params[:id]
    RepositoryLoaderJob.perform_now(@repository)

    redirect_to repositories_path, notice: t('success')
  end

  def update_repos
    @repos = Repository.all.order(updated_at: :asc)
    @repos.each do |repo|
      RepositoryLoaderJob.perform_now(repo)
    end
    redirect_to repositories_path, notice: t('success')
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
