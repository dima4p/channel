class AddTimezoneToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :timezone, :string
  end
end
