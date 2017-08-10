class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.text      :notes,         null:false
      t.integer   :experiment_id, null:false
      t.integer   :observer_id,   null:false
      
      t.timestamps
    end
  end
end
