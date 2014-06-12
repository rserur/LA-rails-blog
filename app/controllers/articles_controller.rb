# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def create
    # call article_params when creating a new article
    @article = Article.new(article_params)

    if @article.save
      params[:article][:category_ids].each do |category_id|
        category = Category.find(category_id) unless category_id == ""
        Categorization.create(article: @article,
          category: category)
      end

    redirect_to '/articles'

    else
      flash.now[:notice] = "Uh oh! Your blog post could not be saved."
      render :new
    end

  end

    #...
  private

  def article_params
    # this method will return a hash like this:
    # { title: "whatever title", author: "some person", body: "blah blah blah" }
    params.require(:article).permit(:title, :author, :body)
  end

end
