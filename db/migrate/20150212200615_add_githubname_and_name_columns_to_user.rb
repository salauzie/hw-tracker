class AddGithubnameAndNameColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :github_name, :string
  end
end
