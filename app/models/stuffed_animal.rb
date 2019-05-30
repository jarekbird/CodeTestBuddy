class StuffedAnimal < Product
  validates :description, uniqueness: { scope: %i[type] }
end
