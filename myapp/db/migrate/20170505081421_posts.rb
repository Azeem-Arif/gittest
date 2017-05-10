class Posts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :vote , :string
    end
end
