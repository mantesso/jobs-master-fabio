class AddXpToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :xp, :integer, default: 0
  end
end
