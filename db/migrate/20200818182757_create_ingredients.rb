class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.text :ingred_detail

      t.timestamps
    end
  end
end
