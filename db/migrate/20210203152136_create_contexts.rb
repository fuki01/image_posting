class CreateContexts < ActiveRecord::Migration[6.1]
  def change
    create_table :contexts do |t|
      t.integer :user_id, :null => false, foreign_key: true
      t.text :body
      t.string :context_img
      t.text :category

      t.timestamps
    end
  end
end
