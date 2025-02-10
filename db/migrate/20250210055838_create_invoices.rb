class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :mechanics

      t.timestamps
    end
  end
end
