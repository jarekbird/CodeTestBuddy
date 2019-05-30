# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StuffedAnimal.create!(
  [
    { description: 'Bear', quantity: 215, cost: 3.21, sale_price: 29.99 },
    { description: 'Elephant', quantity: 345, cost: 3.08, sale_price: 29.99 },
    { description: 'Tiger', quantity: 321, cost: 3.78, sale_price: 29.99 },
    { description: 'Gorilla', quantity: 78, cost: 3.94, sale_price: 29.99 }
  ]
)

Accessory.create!(
  [
    { description: 'Shoes', size: :small, quantity: 113, cost: 2.45, sale_price: 12.99 },
    { description: 'Shoes', size: :medium, quantity: 145, cost: 2.51, sale_price: 13.99 },
    { description: 'Shoes', size: :large, quantity: 84, cost: 2.67, sale_price: 14.99 },
    { description: 'T-Shirt', size: :small, quantity: 215, cost: 1.28, sale_price: 7.99 },
    { description: 'T-Shirt', size: :medium, quantity: 175, cost: 1.31, sale_price: 8.99 },
    { description: 'T-Shirt', size: :large, quantity: 123, cost: 1.35, sale_price: 9.99 },
    { description: 'Tiara', size: :all_size, quantity: 28, cost: 0.78, sale_price: 7.99 },
    { description: 'Glasses', size: :all_size, quantity: 52, cost: 0.53, sale_price: 6.99 }
  ]
)

# Bear Compatibilities
bear = StuffedAnimal.find_by(description: 'Bear')
Compatibility.create!(
  [
    {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'Shoes', size: :medium)
    }, {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'T-Shirt', size: :medium)
    }, {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'Tiara', size: :all_size)
    }, {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'Glasses', size: :all_size)
    }
  ]
)

# Elephant Compatibilities
elephant = StuffedAnimal.find_by(description: 'Elephant')
Compatibility.create!(
  [
    {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'Shoes', size: :large)
    }, {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'T-Shirt', size: :large)
    }, {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'Tiara', size: :all_size)
    }, {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'Glasses', size: :all_size)
    }
  ]
)

# Tiger Compatibilities
tiger = StuffedAnimal.find_by(description: 'Tiger')
Compatibility.create!(
  [
    {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'Shoes', size: :small)
    }, {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'T-Shirt', size: :small)
    }, {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'Tiara', size: :all_size)
    }, {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'Glasses', size: :all_size)
    }
  ]
)

# Gorilla Compatibilities
gorilla = StuffedAnimal.find_by(description: 'Gorilla')
Compatibility.create!(
  [
    {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'Shoes', size: :medium)
    }, {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'T-Shirt', size: :medium)
    }, {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'Tiara', size: :all_size)
    }, {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'Glasses', size: :all_size)
    }
  ]
)