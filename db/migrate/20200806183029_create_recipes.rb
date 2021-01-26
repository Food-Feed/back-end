class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :image
      t.string :video
      t.string :title
      t.boolean :favorited

      t.timestamps
    end
  end
end
