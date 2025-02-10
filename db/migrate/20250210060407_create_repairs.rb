class CreateRepairs < ActiveRecord::Migration[8.0]
  def change
    create_table :repairs do |t|
      t.references :car, null: false, foreign_key: true
      t.references :mechanic, null: false, foreign_key: true
      t.decimal :cost
      t.text :description
      t.references :invoice, null: false, foreign_key: true
      t.string :mechanic_shop
      t.datetime :repair_date
      t.boolean :completed
      t.integer :time_spent
      t.string :parts

      t.timestamps
    end
  end
end
