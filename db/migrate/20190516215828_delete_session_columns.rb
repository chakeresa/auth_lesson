class DeleteSessionColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :sessions, :email
    remove_column :sessions, :password
  end
end
