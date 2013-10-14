class CreatePanelAttachments < ActiveRecord::Migration
  def change
    create_table :panel_attachments do |t|
      t.text :caption
      t.belongs_to :panel

      t.timestamps
    end
  end
end
