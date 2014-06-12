class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # use comment_params method
    @comment = Comment.new(comment_params)
    # create an association between @comment and @article with the right
    # article_id on the comment
    @comment.article = @article

    if @comment.save
      # use redirect_to instead of redirect
      redirect_to "/articles/#{@article.id}"
    else
      flash.now[:notice] = "Uh oh!  Could not post your comment."

      # use render instead of erb
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
