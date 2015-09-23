class ReviewsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.reviews.create(review_params)
    redirect_to article_path(@article)
  end
 
  private
    def review_params
      params.require(:review).permit(:reviewer, :body)
    end
end
