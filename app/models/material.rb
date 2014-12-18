class Material < ActiveRecord::Base
  has_many :bookedMaterials
  has_many :materials, through: :bookedMaterials
  belongs_to :MaterialKind
  
  attr_accessible :id, :name, :kind_id, :deleted
end
