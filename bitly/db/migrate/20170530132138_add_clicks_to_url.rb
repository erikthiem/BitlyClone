class AddClicksToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :clicks, :integer, :default => 0
  end
end
