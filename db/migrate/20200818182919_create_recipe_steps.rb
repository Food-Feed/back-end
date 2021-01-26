class CreateRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_steps do |t|
      t.integer :recipe_id
      t.text :step_detail

      t.timestamps
    end
  end
end
