require 'csv'
CSV.foreach('/home/kagami/rails/studio/db/seeds/development/Material_kinds.csv', 'r') do |row|
  p row
end
