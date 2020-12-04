class FixColumnNameAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :password_digest, :password
  end
end