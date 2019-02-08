class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :num_active_users
      t.string :logo_path

      t.timestamps
    end
  end
end
