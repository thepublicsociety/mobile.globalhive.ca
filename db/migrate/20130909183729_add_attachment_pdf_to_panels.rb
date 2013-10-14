class AddAttachmentPdfToPanels < ActiveRecord::Migration
  def self.up
    change_table :panels do |t|
      t.has_attached_file :pdf
    end
  end

  def self.down
    drop_attached_file :panels, :pdf
  end
end
