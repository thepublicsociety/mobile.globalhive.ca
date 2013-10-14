class Post < ActiveRecord::Base
  attr_accessible :active, :author, :body, :date, :title, :post_attachments_attributes, :body_french, :title_french
  has_many :post_attachments, dependent: :destroy
  accepts_nested_attributes_for :post_attachments, allow_destroy: true
  validates_uniqueness_of :title
end
