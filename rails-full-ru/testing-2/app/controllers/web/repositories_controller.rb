# frozen_string_literal: true

require 'octokit'

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
    client = Octokit::Client.new
    uri = URI(permitted_params[:link])
    octokit_repo = Octokit::Repository.from_url(uri)
    repository_data = client.repository(octokit_repo)
    # repository_data = JSON.parse(client.repository(octokit_repo))
    rep_data = {
      link: uri,
      description: repository_data['description'],
      default_branch: repository_data['default_branch'],
      watchers_count: repository_data['watchers_count'],
      language: repository_data['language'],
      repo_created_at: repository_data['created_at'],
      repo_updated_at: repository_data['updated_at'],
    }

    new_repo = Repository.create!(rep_data)
    render json: new_repo.to_json
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
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
