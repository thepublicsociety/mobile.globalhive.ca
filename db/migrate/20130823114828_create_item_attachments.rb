class CreateItemAttachments < ActiveRecord::Migration
  def change
    create_table :item_attachments do |t|
      t.text :caption
      t.belongs_to :item

      t.timestamps
    end
  end
end
