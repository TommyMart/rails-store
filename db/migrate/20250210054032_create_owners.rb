class CreateOwners < ActiveRecord::Migration[8.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
