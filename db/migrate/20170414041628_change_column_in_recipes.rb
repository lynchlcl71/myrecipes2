class ChangeColumnInRecipes < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :email, :discription
    change_column :recipes, :discription, :text
  end
end
