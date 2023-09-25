class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :character1, foreign_key: { to_table: :characters }, null: false
      t.references :character2, foreign_key: { to_table: :characters }, null: false
      t.references :winner, foreign_key: { to_table: :characters }, null: true
      t.references :weapon1, foreign_key: { to_table: :weapons }, null: false
      t.references :weapon2, foreign_key: { to_table: :weapons }, null: false
      t.timestamps
    end
  end
end
