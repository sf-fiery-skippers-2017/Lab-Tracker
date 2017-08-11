class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.text      :steps,         null:false
      t.boolean   :is_completed,  default:false
      t.integer   :experiment_id, null:false
      t.timestamps
    end
  end
end
