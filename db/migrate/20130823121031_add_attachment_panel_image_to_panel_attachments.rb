class AddAttachmentPanelImageToPanelAttachments < ActiveRecord::Migration
  def self.up
    change_table :panel_attachments do |t|
      t.attachment :panel_image
    end
  end

  def self.down
    drop_attached_file :panel_attachments, :panel_image
  end
end
