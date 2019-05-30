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
end