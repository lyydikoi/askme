# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'openssl'

class User < ApplicationRecord  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USER_REGEX = /\A[a-zA-Z0-9_]+\Z/i
  DIGEST = OpenSSL::Digest::SHA256.new
  ITERATIONS = 20_000

  has_many :questions
  attr_accessor :password

  before_save :encrypt_password 
  before_validation :username_to_downcase, :email_to_downcase

  validates :email, length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true,
                    presence: true

  validates :username,  length: { maximum: 40 },
                    format: { with: VALID_USER_REGEX },
                    uniqueness: true,
                    presence: true

  validates :password, presence: true, confirmtion: true

  # Служебный метод, преобразующий бинарную строку в шестнадцатиричный формат,
  # для удобства хранения.
  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return user if user.password_hash == hashed_password

    nil
  end

  private 

  def encrypt_password
    if password.present?
      # случайная строка
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def username_to_downcase
    self.username = self.username&.downcase
  end

  def email_to_downcase
    self.email = self.email&.downcase
  end
end
