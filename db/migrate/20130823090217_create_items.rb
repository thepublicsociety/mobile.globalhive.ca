class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :title
      t.text :body
      t.text :description
      t.boolean :featured, default: false
      t.boolean :active, default: true
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end
end
