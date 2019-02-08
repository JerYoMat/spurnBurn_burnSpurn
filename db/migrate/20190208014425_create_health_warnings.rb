class CreateHealthWarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :health_warnings do |t|
      t.string :name
      t.string :link
      t.belongs_to :product 
      t.belongs_to :user 
      t.timestamps
    end
  end
end
