class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.text :definition
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
