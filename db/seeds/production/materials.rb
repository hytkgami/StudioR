# coding: utf-8
require 'csv'

CSV.foreach('db/seeds/development/Materials.csv','r') do |row|
  material = Material.create(
    { name: row[1],
      kind_id: row[0].to_i,
      deleted_at: nil
    }, without_protection: true)

  fname = Rails.root.join("app/assets/images", "no_image_x3.png")
  MaterialImage.create(
    { material: material,
      data: File.open(fname, "rb").read,
      content_type: "image/png"
  }, without_protection: true)
end
