class Character < ApplicationRecord
  has_many :initiated_fights, class_name: 'Fight', foreign_key: 'character1_id'
  has_many :responded_fights, class_name: 'Fight', foreign_key: 'character2_id'

  validates :name, presence: true, uniqueness: true
  validates :life_points, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 200 }
  validates :attack_points, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }

  def fights
    Fight.where('character1_id = ? OR character2_id = ?', id, id).count
  end

  def wins
    Fight.where(winner_id: id).count
  end

  def win_rate
    total_fights = fights
    return 0 if total_fights.zero?

    total_wins = wins
    (total_wins.to_f / total_fights * 100).round(2)
  end
end
