class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :name
      t.string :title
      t.string :category
      t.string :subcategory
      t.string :color
      t.text :body
      t.text :description
      t.boolean :featured, default: false
      t.boolean :active, default: true
      t.belongs_to :panel

      t.timestamps
    end
  end
end
