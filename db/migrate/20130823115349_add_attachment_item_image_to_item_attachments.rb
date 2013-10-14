class AddAttachmentItemImageToItemAttachments < ActiveRecord::Migration
  def self.up
    change_table :item_attachments do |t|
      t.attachment :item_image
    end
  end

  def self.down
    drop_attached_file :item_attachments, :item_image
  end
end
