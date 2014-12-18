class Member < ActiveRecord::Base
  has_many :bookings
  acts_as_paranoid
  
  attr_accessible :user_id, :name, :tel, :email, :administrator, :password, :password_confirmation
  attr_accessor :password, :password_confirmation

  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  private
  class << self
    def authenticate(email, password)
      member = find_by_email(email)
      if member && member.hashed_password.present? &&
        BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
end
