class Panel < ActiveRecord::Base
  attr_accessible :active, :body, :category, :color, :description, :featured, :name, :subcategory, :title, :panel_attachments_attributes, :name_french, :pdf
  has_many :items
  has_many :panel_attachments, dependent: :destroy
  accepts_nested_attributes_for :panel_attachments, allow_destroy: true
  has_attached_file :pdf
end
