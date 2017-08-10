class CreateExperiments < ActiveRecord::Migration[5.1]
  def change
    create_table :experiments do |t|
      t.string    :title,        null:false
      t.text      :results
      t.text      :conclusion
      t.integer   :proposal_id,  null:false
      t.integer   :lab_staff_id, null:false

      t.timestamps
    end
  end
end
