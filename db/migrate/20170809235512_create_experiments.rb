class CreateExperiments < ActiveRecord::Migration[5.1]
  def change
    create_table :experiments do |t|

      t.timestamps
    end
  end
end
