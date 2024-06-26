class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
