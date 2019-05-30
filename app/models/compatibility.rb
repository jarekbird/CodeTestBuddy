class Compatibility < ApplicationRecord
  belongs_to :stuffed_animal, class_name: 'StuffedAnimal'
  belongs_to :accesory, class_name: 'Accessory'
end
