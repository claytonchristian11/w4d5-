class User < ApplicationRecord
  validates :username, :password_digest, :cheers, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    (@user && is_password?(password)) ? @user : nil 

  end

  def resets_session_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
