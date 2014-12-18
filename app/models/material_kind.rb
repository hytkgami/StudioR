class MaterialKind < ActiveRecord::Base
  has_many :materials

  attr_accessible :id, :name
end
