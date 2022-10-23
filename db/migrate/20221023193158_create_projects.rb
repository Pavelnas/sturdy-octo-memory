class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :owner_id, index: true
      t.integer :state, default: 0
      t.float :progress, default: 0.0

      t.timestamps
    end
  end
end
