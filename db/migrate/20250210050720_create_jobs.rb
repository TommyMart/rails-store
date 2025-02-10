class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.float :total_time
      t.boolean :completed
      t.decimal :cost
      t.text :parts

      t.timestamps
    end
  end
end
