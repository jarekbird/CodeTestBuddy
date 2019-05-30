class OrderHistoryCsvParsing
  SIZE_CONVERSION = { Small: "small", Medium: "medium", Large: "large", All: "all_size" }.freeze
  def self.parse_orders
    require 'csv'
    csv = CSV.read('lib/assets/OrdersRecord.csv')
    description_row = csv[1]
    size_row = csv[0]
    (2...csv.length).each do |row_index|
      row = csv[row_index]
      order = Order.create!(order_date: (row[0] + row[1]).to_datetime)
      (2...row.length).each do |column_index|
        value = row[column_index]&.to_i
        next unless value > 0

        size = determine_size(size_row, column_index)
        type = column_index > 5 ? 'Accessory' : 'StuffedAnimal'
        product = Product.find_by(description: description_row[column_index]&.downcase, type: type, size: size)
        order.purchases.create!(product: product, quantity: value)
      end
    end
  end

  def self.determine_size(size_row, column_index)
    return nil if column_index <= 5

    value = size_row[column_index]&.to_sym || size_row[column_index - 1]&.to_sym
    Accessory::sizes[SIZE_CONVERSION[value]]
  end
end