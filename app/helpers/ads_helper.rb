module AdsHelper
  
  def watching?(id)
    watching = Watching.find(:first, :conditions => [" ad_id = ? && user_id = ?",id,current_user.id])
    !watching.blank?
  end
end
