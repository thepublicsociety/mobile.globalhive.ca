class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.text :caption
      t.belongs_to :post

      t.timestamps
    end
  end
end
