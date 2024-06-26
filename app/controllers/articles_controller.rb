class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :search]

  def search
    
  end

  def index
    @articles = Article.all
  end

  def private
    @articles = Article.all
  end

  def archive
    @articles = Article.all
  end

  def all
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    if @article.private?
      http_basic_authenticate_or_request_with name: "dhh", password: "secret"
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to "/articles"
  end

  private
  def article_params
    params.require(:article).permit(:title, :author, :body, :status)
  end
end