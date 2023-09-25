class Fight < ApplicationRecord
  belongs_to :character1, class_name: 'Character'
  belongs_to :character2, class_name: 'Character'
  belongs_to :winner, class_name: 'Character', optional: true
  belongs_to :weapon1, class_name: 'Weapon'
  belongs_to :weapon2, class_name: 'Weapon'

  validate :fighter_cannot_fight_himself

  private

  def fighter_cannot_fight_himself
    return unless character1_id == character2_id

    errors.add(:character2_id, "can't be the same as Character 1")
  end
end
