class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :home_url
      t.string :language
      t.string :slug
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
