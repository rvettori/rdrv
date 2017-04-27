class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.date :born_at
      t.references :zipcode, foreign_key: true
      t.string :nationality
      t.references :occupation, foreign_key: true
      t.string :about

      t.timestamps
    end
  end
end
