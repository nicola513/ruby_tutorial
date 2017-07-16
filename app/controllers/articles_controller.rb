class ArticlesController < ApplicationController
 before_filter :authenticate,
 except: [:index, :show]

 def index
  @articles = Article.all
 end

 def show
  @article = Article.find(params[:id])
 end

 def new
  @article = Article.new
 end

 def edit
  @article = Article.find(params[:id])
 end

 def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
 end

 def create
  @article = Article.new(article_params)

  if @article.save
  redirect_to @article
  else
   render 'new'
  end
 end

 def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
   redirect_to @article
  else
   render 'edit'
  end
 end

 private
  def article_params
   params.require(:article).permit(:title, :text)
  end

  def authenticate
   if session[:user_name]==nil
    session[:return_to] =request.url
    redirect_to '/auth/facebook'
   end
  end
end
