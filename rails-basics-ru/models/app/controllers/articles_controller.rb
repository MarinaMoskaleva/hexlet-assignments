class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])

    if @article
      render :show
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
    
  end
end
