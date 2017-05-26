class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :target
      t.string :shortcode

      t.timestamps
    end
  end
end
