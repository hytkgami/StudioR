class Material < ActiveRecord::Base
  has_many :bookedMaterials, dependent: :destroy
  has_many :bookings, through: :bookedMaterials, dependent: :destroy
  has_one :image, class_name: "MaterialImage", dependent: :destroy

  belongs_to :MaterialKind
  
  attr_accessible :id, :name, :kind_id, :image_attributes

  accepts_nested_attributes_for :image, allow_destroy: true
  acts_as_paranoid

  def get_kind_name(id)
    MaterialKind.find(id).name
  end
end
