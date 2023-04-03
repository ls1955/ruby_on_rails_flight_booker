class RenameFlightsColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :start, :depart
  end
end
