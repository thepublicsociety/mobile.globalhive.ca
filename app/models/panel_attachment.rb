class PanelAttachment < ActiveRecord::Base
  attr_accessible :caption, :panel_image
  belongs_to :panel
  has_attached_file :panel_image, :styles => {:display => "500x500>", :thumb => "250x250>"}, :default_url => "/assets/empty.png"
end
