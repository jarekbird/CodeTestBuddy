class Compatibility < ApplicationRecord
  belongs_to :stuffed_animal, class_name: 'StuffedAnimal'
  belongs_to :accessory, class_name: 'Accessory'
end
