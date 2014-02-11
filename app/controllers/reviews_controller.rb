class ReviewsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @reviews = Review.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @ad = Ad.find(params[:id])
    @reviews = @ad.reviews.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = "Review Successfully Posted."
      redirect_to review_path(params[:ad])
    else
      flash[:notice] = "Review is Invalid"
      redirect_to review_path(params[:ad])
    end
  end
end
