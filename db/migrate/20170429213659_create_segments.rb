class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
      t.string :target
      t.string :description
      t.text :query

      t.timestamps
    end
  end
end
