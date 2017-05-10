class CheckPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :status, :boolean, default: false
  end
end
