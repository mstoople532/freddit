class User < ApplicationRecord
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(plaintext_password)
    @password = BCrypt::Password.create(plaintext_password)
    self.password_hash = @password
  end
end
