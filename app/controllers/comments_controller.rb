class CommentsController < ApplicationController
 before_filter :authenticate,
 only: :destroy

 def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.create(comment_params)
  redirect_to article_path(@article)
 end

 def destroy
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
  @comment.destroy
  redirect_to article_path(@article)
 end

 private
  def comment_params
   params.require(:comment).permit(:commenter, :body)
  end

   def authenticate
   if session[:user_name]==nil
    session[:return_to] = '/articles/'+params[:article_id]+'/comments/'+params[:id]
    redirect_to '/auth/facebook'
   end
  end


end
