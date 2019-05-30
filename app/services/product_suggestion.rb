class ProductSuggestion
  def self.suggest_product(products)
    orders = Order.all
    products.each do |product|
      purchase_orders = Purchase.where(product: product).pluck(:order_id)
      orders = orders.where(id: purchase_orders)  
    end
    other_purchases = Purchase.where(order: orders).where.not(product: products)
    other_purchases.group(:product).order('count_id DESC').limit(1).count(:id)&.first&.first
  end

  def self.suggest_build(price)
    return [] if price < 29.99

    recurse_build_options(0, 0, price, [], [], [], {})
  end

  def self.recurse_build_options(current_value, current_price, max_price, stuffed_animals, accessories, solutions, traversed_trees)
    return solutions if already_traversed(stuffed_animals, accessories, traversed_trees)
    solutions = recurse_stuffed_animals(current_value, current_price, max_price, stuffed_animals, accessories, solutions, traversed_trees)
    solutions = recurse_accessories(current_value, current_price, max_price, stuffed_animals, accessories, solutions, traversed_trees)
    compare_solutions(current_value, current_price, stuffed_animals, accessories, solutions)
  end

  def self.stuffed_animals_key(stuffed_animals)
    stuffed_animals.map { |stuffed_animal| stuffed_animal_key(stuffed_animal) }.join(":")
  end

  def self.accessories_value(accessories)
    accessories.map { |accessory| accessory_value(accessory) }.join(":")
  end

  def self.accessory_value(accessory)
    "#{accessory.description}/#{accessory.size}"
  end

  def self.stuffed_animal_key(stuffed_animal)
    stuffed_animal.description
  end

  def self.already_traversed(stuffed_animals, accessories, traversed_trees)
    traversed_trees[stuffed_animals_key(stuffed_animals)]&.include?(accessories_value(accessories))
  end

  def self.recurse_stuffed_animals(current_value, current_price, max_price, stuffed_animals, accessories, solutions, traversed_trees)
    StuffedAnimal.all.each do |stuffed_animal|
      new_price = stuffed_animal.sale_price + current_price 
      next if new_price > max_price

      value = stuffed_animal.sale_price - stuffed_animal.cost
      new_stuffed_animals = stuffed_animals.dup
      new_stuffed_animals = new_stuffed_animals.sort_by{ |stuffed_animal| stuffed_animal_key(stuffed_animal) }
      stuffed_animal_key = stuffed_animals_key(new_stuffed_animals)
      traversed_trees[stuffed_animal_key] = [] if traversed_trees[stuffed_animal_key].blank?
      traversed_trees[stuffed_animal_key] << accessories_value(accessories)
      solutions = recurse_build_options(current_value + value, new_price, max_price, new_stuffed_animals << stuffed_animal, accessories, solutions, traversed_trees)
    end
    solutions
  end
  
  def self.recurse_accessories(current_value, current_price, max_price, stuffed_animals, accessories, solutions, traversed_trees)
    Compatibility.where(stuffed_animal: stuffed_animals).each do |compatibility|
      accessory = compatibility.accessory
      new_price = accessory.sale_price + current_price
      next if new_price > max_price

      value = accessory.sale_price - accessory.cost
      new_accessories = accessories.dup
      new_accessories = new_accessories.sort_by{ |accessory| accessory_value(accessory) }
      stuffed_animals_key = stuffed_animals_key(stuffed_animals)
      traversed_trees[stuffed_animals_key] = [] if traversed_trees[stuffed_animals_key].blank?
      traversed_trees[stuffed_animals_key] << accessories_value(new_accessories)
      solutions = recurse_build_options(current_value + value, new_price, max_price, stuffed_animals, new_accessories << accessory, solutions, traversed_trees)
    end
    solutions
  end

  def self.compare_solutions(current_value, current_price, stuffed_animals, accessories, solutions)
    if solutions.length < 3 || solutions.last&.dig(:value) < current_value
      solutions << {value: current_value, current_price: current_price, stuffed_animals: stuffed_animals, accessories: accessories }
      solutions = solutions.sort_by { |solution| solution[:value] }.reverse
      solutions.pop if solutions.length > 3
    end
    solutions
  end
end