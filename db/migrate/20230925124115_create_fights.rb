class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :character1, null: false, foreign_key: true
      t.references :character2, null: false, foreign_key: true
      t.references :winner, null: false, foreign_key: true
      t.references :weapon1, null: false, foreign_key: true
      t.references :weapon2, null: false, foreign_key: true

      t.timestamps
    end
  end
end
