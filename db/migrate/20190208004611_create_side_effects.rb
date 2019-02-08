class CreateSideEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :side_effects do |t|
      t.string :name 
      t.string :link 
      t.belongs_to :product 
      t.belongs_to :user 
      t.boolean :validated
      t.timestamps
    end
  end
end
