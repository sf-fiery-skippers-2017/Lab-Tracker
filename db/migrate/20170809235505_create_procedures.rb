class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|

      t.timestamps
    end
  end
end
