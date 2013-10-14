class CreateSectionAttachments < ActiveRecord::Migration
  def change
    create_table :section_attachments do |t|
      t.string :label
      t.belongs_to :section
      t.timestamps
    end
  end
end
