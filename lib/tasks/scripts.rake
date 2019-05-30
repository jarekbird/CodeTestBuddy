
namespace :scripts do
  desc 'One time only scripts'
  task download_csv_orders: :environment do
    OrderHistoryCsvParsing.parse_orders
  end
end