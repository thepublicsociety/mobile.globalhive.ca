class AddCaptionFrenchToItemAttachments < ActiveRecord::Migration
  def change
    add_column :item_attachments, :caption_french, :text
  end
end
