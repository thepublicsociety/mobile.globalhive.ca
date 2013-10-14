class AddAttachmentSectionUploadToSectionAttachments < ActiveRecord::Migration
  def self.up
    change_table :section_attachments do |t|
      t.has_attached_file :section_upload
    end
  end

  def self.down
    drop_attached_file :section_attachments, :section_upload
  end
end
