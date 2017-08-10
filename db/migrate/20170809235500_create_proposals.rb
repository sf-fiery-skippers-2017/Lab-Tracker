class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string  :title,     null:false
      t.text    :summary,    null:false
      t.text    :hypothesis, null:false
      t.string  :status,     default:"open"
      t.integer :pi_id,       null:false
      t.timestamps
    end
  end
end
