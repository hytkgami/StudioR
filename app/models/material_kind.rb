class MaterialKind < ActiveRecord::Base
  has_many :materials, dependent: :destroy

  attr_accessible :id, :name

  scope :get_kind_name,
    ->(id) { where("id = ?", id) }
end
