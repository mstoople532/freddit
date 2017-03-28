class User < ApplicationRecord
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(plaintext_password)
    encrypted_password = BCrypt::Password.create(plaintext_password)
    self.password_hash = encrypted_password
  end
end
