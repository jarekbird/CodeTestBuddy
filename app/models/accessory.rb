class Accessory < Product
  enum size: {
    small: 0,
    medium: 1,
    large: 2,
    all_size: 3
  }
  validates :size, inclusion: { in: sizes }, presence: true
  validates :description, uniqueness: { scope: %i[size type] }
end