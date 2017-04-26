class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string :code
      t.string :street
      t.string :neighbordhood
      t.string :city
      t.string :state
      t.string :ibge

      t.timestamps
    end
  end
end
