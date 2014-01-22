class UsersSecurePasswordFields < ActiveRecord::Migration
  def up
    add_column :users, :password_digest, :string
    add_column :users, :password_salt, :string

    User.all.each do |user|
      user.change_password(user.password)
    end

    remove_column :users, :password
  end

  def down
    # This is a one-way migration.
  end
end
