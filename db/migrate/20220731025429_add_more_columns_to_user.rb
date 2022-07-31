class AddMoreColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    # https://stackoverflow.com/questions/28836153/rails-4-add-multiple-columns-to-existing-table
    # add_column :table, :new_column, :type
    add_column :users, :full_name, :string
    add_column :users, :uid, :string
    add_column :users, :avatar_url, :string
    add_column :users, :provider, :string
  end
end
