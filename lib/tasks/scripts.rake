task download_csv_orders: :environment do
  csv = CSV.read('lib/assets/OrdersRecord.csv')
end