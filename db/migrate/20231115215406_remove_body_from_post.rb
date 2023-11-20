class RemoveBodyFromPost < ActiveRecord::Migration[7.1]
  def up
    remove_column :posts, :body
  end

  def down
    add_column :posts, :body, :text, null: false
  end
end
