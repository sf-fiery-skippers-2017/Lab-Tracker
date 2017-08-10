class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|

      t.timestamps
    end
  end
end
