class ItemAttachment < ActiveRecord::Base
  attr_accessible :caption, :item_image, :caption_french
  belongs_to :item
  has_attached_file :item_image, :styles => {:display => "500x500>", :thumb => "250x250>", :expanded => "696x254#", :featured => "486x442#", :large => "486x442#", :wide => "486x238#", :small => "238x238#", :tall => "238x486#"}, :default_url => "/assets/empty.png"
  #validates_attachment_size :item_image, :in => 0.megabytes..1.megabytes
end
