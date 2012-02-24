class UserActionsController < ApplicationController
  before_filter :authenticate_user!

  def watchings
    @watchings = current_user.watchings
  end
  
  def create_watching
    @watch = Watching.create(:user => current_user , :ad_id => params[:id] , :ad_title => Ad.find(params[:id]).title)
    render :json => "ok"
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
end
