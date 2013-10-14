class Section < ActiveRecord::Base
  attr_accessible :active, :body, :title, :body_french, :title_french, :section_attachments_attributes
  has_many :section_attachments, dependent: :destroy
  accepts_nested_attributes_for :section_attachments, allow_destroy: true
end
