class Weapon < ApplicationRecord
  has_many :primary_fights, class_name: 'Fight', foreign_key: 'weapon1_id'
  has_many :secondary_fights, class_name: 'Fight', foreign_key: 'weapon2_id'
end
