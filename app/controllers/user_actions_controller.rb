class UserActionsController < ApplicationController
  before_filter :authenticate_user!

  def watchings
    @watchings = current_user.watchings
  end
  
  def create_watching
    @watch = Watch.create(:user => current_user , :ad_id => params[:id] , :title => Ad.find(params[:id]).title)
  end
end
