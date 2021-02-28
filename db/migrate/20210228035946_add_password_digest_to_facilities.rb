class AddPasswordDigestToFacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :password_digest, :string
  end
end
