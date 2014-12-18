# coding: utf-8
require 'csv'

CSV.foreach('/home/kagami/rails/studio/db/seeds/development/Materials.csv','r') do |id, row|
  Material.create(
                  name: row,
                  kind_id: rand(9) + 1
                 )
end
