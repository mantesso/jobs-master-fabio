class ModifyFightsTableForNoWeapons < ActiveRecord::Migration[7.0]
  def change
    change_column_null :fights, :weapon1_id, true
    change_column_null :fights, :weapon2_id, true
  end
end
