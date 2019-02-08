class CreateSideEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :side_effects do |t|

      t.timestamps
    end
  end
end
