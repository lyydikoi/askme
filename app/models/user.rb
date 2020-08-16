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
class User < ApplicationRecord
  before_save do
    self.username = self.username.downcase
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_USER_REGEX = /\A[a-zA-Z0-9_]+\Z/i
  validates :username,  length: { maximum: 40 },
                    format: { with: VALID_USER_REGEX },
                    uniqueness: { case_sensitive: false }
end
