class PostAttachment < ActiveRecord::Base
  attr_accessible :caption, :post_image
  belongs_to :post
  has_attached_file :post_image, :styles => {:display => "500x500>", :thumb => "250x250>"}, :default_url => "/assets/empty.png"
end
