class AddAttachmentPostImageToPostAttachments < ActiveRecord::Migration
  def self.up
    change_table :post_attachments do |t|
      t.attachment :post_image
    end
  end

  def self.down
    drop_attached_file :post_attachments, :post_image
  end
end
