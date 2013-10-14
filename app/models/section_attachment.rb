class SectionAttachment < ActiveRecord::Base
  attr_accessible :label, :section_upload
  belongs_to :section
  has_attached_file :section_upload
end
