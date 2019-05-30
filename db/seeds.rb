# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StuffedAnimal.create!(
  [
    { description: 'bear', quantity: 215, cost: 3.21, sale_price: 29.99 },
    { description: 'elephant', quantity: 345, cost: 3.08, sale_price: 29.99 },
    { description: 'tiger', quantity: 321, cost: 3.78, sale_price: 29.99 },
    { description: 'gorilla', quantity: 78, cost: 3.94, sale_price: 29.99 }
  ]
)

Accessory.create!(
  [
    { description: 'shoes', size: :small, quantity: 113, cost: 2.45, sale_price: 12.99 },
    { description: 'shoes', size: :medium, quantity: 145, cost: 2.51, sale_price: 13.99 },
    { description: 'shoes', size: :large, quantity: 84, cost: 2.67, sale_price: 14.99 },
    { description: 't-shirt', size: :small, quantity: 215, cost: 1.28, sale_price: 7.99 },
    { description: 't-shirt', size: :medium, quantity: 175, cost: 1.31, sale_price: 8.99 },
    { description: 't-shirt', size: :large, quantity: 123, cost: 1.35, sale_price: 9.99 },
    { description: 'tiara', size: :all_size, quantity: 28, cost: 0.78, sale_price: 7.99 },
    { description: 'glasses', size: :all_size, quantity: 52, cost: 0.53, sale_price: 6.99 }
  ]
)

# bear Compatibilities
bear = StuffedAnimal.find_by(description: 'bear')
Compatibility.create!(
  [
    {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'shoes', size: :medium)
    }, {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 't-shirt', size: :medium)
    }, {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'tiara', size: :all_size)
    }, {
      stuffed_animal: bear,
      accessory: Accessory.find_by(description: 'glasses', size: :all_size)
    }
  ]
)

# elephant Compatibilities
elephant = StuffedAnimal.find_by(description: 'elephant')
Compatibility.create!(
  [
    {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'shoes', size: :large)
    }, {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 't-shirt', size: :large)
    }, {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'tiara', size: :all_size)
    }, {
      stuffed_animal: elephant,
      accessory: Accessory.find_by(description: 'glasses', size: :all_size)
    }
  ]
)

# tiger Compatibilities
tiger = StuffedAnimal.find_by(description: 'tiger')
Compatibility.create!(
  [
    {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'shoes', size: :small)
    }, {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 't-shirt', size: :small)
    }, {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'tiara', size: :all_size)
    }, {
      stuffed_animal: tiger,
      accessory: Accessory.find_by(description: 'glasses', size: :all_size)
    }
  ]
)

# gorilla Compatibilities
gorilla = StuffedAnimal.find_by(description: 'gorilla')
Compatibility.create!(
  [
    {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'shoes', size: :medium)
    }, {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 't-shirt', size: :medium)
    }, {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'tiara', size: :all_size)
    }, {
      stuffed_animal: gorilla,
      accessory: Accessory.find_by(description: 'glasses', size: :all_size)
    }
  ]
)