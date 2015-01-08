# coding: utf-8
require 'csv'

CSV.foreach('/home/kagami/rails/studio/db/seeds/development/Material_kinds.csv','r') do |row|
  MaterialKind.create(name: row[0].to_s)
end
