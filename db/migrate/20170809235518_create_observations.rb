class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|

      t.timestamps
    end
  end
end
