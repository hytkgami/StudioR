# coding: utf-8
require 'csv'

CSV.foreach('/home/kagami/rails/studio/db/seeds/development/Materials.csv','r') do |row|
  Material.create(
                  name: row[1],
                  kind_id: row[0].to_i
                 )
end
