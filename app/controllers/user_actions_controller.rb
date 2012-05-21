class UserActionsController < ApplicationController
  before_filter :authenticate_user!

  def watchings
    @watchings = current_user.watchings
  end
  
  def create_watching
    ad = Ad.find(params[:id])
    @watch = Watching.create(:user => current_user , :ad_id => ad.id , :ad_title => ad.title)
    respond_to do |format|
      format.html { }
      format.js  { }
    end
  end

  def unwatch
    if params[:id]
      Watching.delete_all("id in (#{params[:id].join(',')})")
    end
  redirect_to users_watchings_path
  end

  def ads
    @ads = current_user.ads
  end

  def reviews
    @reviews = current_user.reviews.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end
end
