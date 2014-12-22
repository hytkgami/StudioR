class MaterialKind < ActiveRecord::Base
  has_many :materials, dependent: :destroy

  attr_accessible :id, :name
end
