class Member < ActiveRecord::Base
  include EmailAddressChecker
  has_many :bookings, dependent: :destroy
  acts_as_paranoid
  
  attr_accessible :user_id, :name, :tel, :email, :administrator, :password, :password_confirmation
  attr_accessor :password, :password_confirmation

  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }
  validates :name, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true,
    message: :invalid_name_format },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false, message: :invalid_member_name }
  validate :check_email
  validates :tel, format: { with: /[0-9]/, message: :invalid_tel },
    length: { minimum: 6, maximum: 13 }

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end

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
