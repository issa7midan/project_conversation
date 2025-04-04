class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :company, null: false, foreign_key: true
      t.integer :status, default: 0
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
