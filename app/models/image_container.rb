class ImageContainer < ActiveRecord::Base 
  attr_accessible :sort_order, :content_image, :container 
  belongs_to :content_image 
  belongs_to :container, :polymorphic => true 
  accepts_nested_attributes_for :container 
  scope :in_sort_order, order("sort_order ASC") 
end