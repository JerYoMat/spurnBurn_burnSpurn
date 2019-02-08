class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :score
      t.belongs_to :user 
      t.belongs_to :side_effect
      t.timestamps
    end
  end
end
