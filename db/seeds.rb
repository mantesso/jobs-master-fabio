characters_data = [
  { name: 'Aragorn', life_points: 200, attack_points: 45 },
  { name: 'Legolas', life_points: 190, attack_points: 40 },
  { name: 'Gimli', life_points: 180, attack_points: 50 },
  { name: 'Frodo', life_points: 170, attack_points: 35 },
  { name: 'Sam', life_points: 160, attack_points: 30 }
]

characters_data.each do |char_data|
  Character.create!(name: char_data[:name], life_points: char_data[:life_points],
                    attack_points: char_data[:attack_points])
end

weapons_data = [
  { name: 'Anduril', attack_points: 20 },
  { name: 'Bow of the Galadhrim', attack_points: 18 },
  { name: 'Axe of Erebor', attack_points: 25 },
  { name: 'Sting', attack_points: 15 },
  { name: "Sam's Sword", attack_points: 12 }
]

weapons_data.each do |weapon_data|
  Weapon.create!(name: weapon_data[:name], attack_points: weapon_data[:attack_points])
end
