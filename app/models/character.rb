class Character < ApplicationRecord
  has_many :initiated_fights, class_name: 'Fight', foreign_key: 'character1_id'
  has_many :responded_fights, class_name: 'Fight', foreign_key: 'character2_id'

  validates :name, presence: true, uniqueness: true
  validates :life_points, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 200 }
  validates :attack_points, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }
end
