class AddSectionIdToSectionAttachments < ActiveRecord::Migration
  def change
    add_column :section_attachments, :section_id, :integer
  end
end
