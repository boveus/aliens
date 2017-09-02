class CreateStatePopulations < ActiveRecord::Migration[5.1]
  def change
    create_table :state_populations do |t|
      t.string :state
      t.integer :population

      t.timestamps
    end
  end
end
