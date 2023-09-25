class Fight < ApplicationRecord
  belongs_to :character1, class_name: 'Character'
  belongs_to :character2, class_name: 'Character'
  belongs_to :winner, class_name: 'Character', optional: true
  belongs_to :weapon1, class_name: 'Weapon'
  belongs_to :weapon2, class_name: 'Weapon'
end
