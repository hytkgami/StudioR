class Material < ActiveRecord::Base
  has_many :bookedMaterials, dependent: :destroy
  has_many :bookings, through: :bookedMaterials, dependent: :destroy
  belongs_to :MaterialKind
  
  attr_accessible :id, :name, :kind_id, :deleted_at
  acts_as_paranoid

  def get_kind_name(id)
    MaterialKind.find(id).name
  end
end
