class AddClientToWpts < ActiveRecord::Migration[5.1]
  def change
    add_column :wpts, :client, :string
  end
end
