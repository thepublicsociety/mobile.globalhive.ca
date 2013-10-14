class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :body
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
