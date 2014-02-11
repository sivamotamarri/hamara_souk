# To change this template, choose Tools | Templates
# and open the template in the editor.

class Ad::Image < Asset
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
