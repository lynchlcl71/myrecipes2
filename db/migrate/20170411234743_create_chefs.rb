class CreateChefs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefs do |t|
      t.string :chefname
      t.string :emails
      t.timestamps
    end
  end
end
